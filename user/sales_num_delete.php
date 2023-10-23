<?php
error_reporting(E_ALL);
session_start();
$id2 = $_SESSION['id'];
$branch = $_SESSION['branch'];
include('../dist/includes/dbcon.php');

$id = $_GET['id'];


 mysqli_query($con, "DELETE FROM sales WHERE sales_id = '$id'") or die(mysqli_error($con));
 mysqli_query($con, "DELETE FROM sales_details WHERE sales_id = '$id'") or die(mysqli_error($con));


echo "<script>document.location='sales_receipt_draft'</script>";
?>
