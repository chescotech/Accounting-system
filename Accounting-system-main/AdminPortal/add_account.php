<?php
include('../dist/includes/dbcon.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $name = $_POST["name"];
    $description = $_POST["description"];
    $detailType = $_POST["detail_type"]; 
    $accountType = $_POST["account_type"]; 
    $balance = $_POST["Balance"];
    $date = $_POST["date"]; 

    $checkQuery = "SELECT COUNT(*) as count FROM payment_account WHERE name = '$name'";
    $result = mysqli_query($con, $checkQuery);
    $row = mysqli_fetch_assoc($result);
    $count = $row["count"];

    if ($count > 0) {
        echo "<script>alert('Error: This name already exists.');
              window.location.href = '{$_SERVER['HTTP_REFERER']}';
              </script>";
    } else {
        $insertQuery = "INSERT INTO payment_account (name, balance, date, description, detail_type, account_type)
                        VALUES ('$name', '$balance', '$date', '$description', '$detailType', '$accountType')";
        if (mysqli_query($con, $insertQuery)) {
            echo "<script>alert('Record inserted successfully.');
                  window.location.href = '{$_SERVER['HTTP_REFERER']}';
                  </script>";
        } else {
            echo "<script>alert('Error: An error occurred while inserting the record.');
                  window.location.href = '{$_SERVER['HTTP_REFERER']}';
                  </script>";
        }
    }

    mysqli_close($con);
}
?>
