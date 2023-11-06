<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include('../dist/includes/dbcon.php');

// Get the form data from the POST request
$name = $_POST['name'];
$code = $_POST['code'];
$currency = $_POST['currency'];
$acc_number = $_POST['acc_number'];
$id = $_POST['id'];
$bank_name = $_POST['bank_name'];
$routing = $_POST['routing'];
$description = $_POST['description'];

// Update the database with the new form data
$sql = "UPDATE bank SET account_name='$name', account_code='$code', currency='$currency', account_number='$acc_number', bank_name='$bank_name', routing_number='$routing', description='$description' WHERE id='$id'";


if (!mysqli_query($con, $sql)) {
    die('Error updating bank: ' . mysqli_error($con));
}

mysqli_close($con);

echo "<script>alert('Record inserted successfully.');
                  window.location.href = '{$_SERVER['HTTP_REFERER']}';
                  </script>";

?>
