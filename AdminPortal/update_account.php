<?php
include('../dist/includes/dbcon.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $name = $_POST["name"];
    $description = $_POST["description"];
    $detailType = $_POST["detail_type"]; 
    $accountType = $_POST["account_type"]; 
    $balance = $_POST["Balance"];
    $date = $_POST["date"]; 

    // Check if the record with the provided name exists
    $checkQuery = "SELECT COUNT(*) as count FROM payment_account WHERE name = '$name'";
    $result = mysqli_query($con, $checkQuery);
    $row = mysqli_fetch_assoc($result);
    $count = $row["count"];

    if ($count > 0) {
        // Update the existing record
        $updateQuery = "UPDATE payment_account SET 
                        balance = '$balance', 
                        date = '$date', 
                        description = '$description', 
                        detail_type = '$detailType', 
                        account_type = '$accountType' 
                        WHERE name = '$name'";

        if (mysqli_query($con, $updateQuery)) {
            echo "<script>alert('Record updated successfully.');
                  window.location.href = '{$_SERVER['HTTP_REFERER']}';
                  </script>";
        } else {
            echo "<script>alert('Error: An error occurred while updating the record.');
                  window.location.href = '{$_SERVER['HTTP_REFERER']}';
                  </script>";
        }
    } else {
        echo "<script>alert('Error: The record with this name does not exist.');
              window.location.href = '{$_SERVER['HTTP_REFERER']}';
              </script>";
    }

    mysqli_close($con);
}
?>
