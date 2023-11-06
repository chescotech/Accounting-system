<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include('../dist/includes/dbcon.php');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $name = $_POST["name"];
    $bank_name = $_POST["bank_name"];
    $description = $_POST["description"];
    $code = $_POST["code"]; 
    $currency = $_POST["currency"]; 
    $balance = $_POST["Balance"];
    $date = $_POST["date"]; 
    $number = $_POST["acc_number"]; 
    $rout = $_POST["routing"]; 

    // Extract the first two characters of each value
    $bank_number = substr($bank_name, 0, 2) . '-' . substr($name, 0, 2) . '-' . substr($number, 0, 2) . '-' . substr($rout, 0, 2);

    $checkQuery = "SELECT COUNT(*) as count FROM bank WHERE account_name = '$name' AND bank_name = '$bank_name'";
    $result = mysqli_query($con, $checkQuery);
    $row = mysqli_fetch_assoc($result);
    $count = $row["count"];

    if ($count > 0) {
        echo "<script>alert('Error: This name already exists.');
              window.location.href = '{$_SERVER['HTTP_REFERER']}';
              </script>";
    } else {
        $insertQuery = "INSERT INTO bank (account_name, bank_name, description, account_code, currency, opening_balance, date, account_number, routing_number, total, bank_number)
                VALUES ('$name', '$bank_name', '$description', '$code', '$currency', '$balance', '$date', '$number', '$rout', '$balance', '$bank_number')";

        if (mysqli_query($con, $insertQuery)) {
            echo "<script>alert('Record inserted successfully.');
                  window.location.href = '{$_SERVER['HTTP_REFERER']}';
                  </script>";
              
        } else {
            $error_message = mysqli_error($con);
            echo "<script>alert('Error: $error_message');
                  window.location.href = '{$_SERVER['HTTP_REFERER']}';
                  </script>";
          
        }
    }
    mysqli_close($con);
}
?>
