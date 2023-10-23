<?php
error_reporting(E_ALL);
session_start();
$id2 = $_SESSION['id'];
$branch = $_SESSION['branch'];
include('../dist/includes/dbcon.php');

$user_id = $_SESSION['id'];
$qty = $_POST['qty'];
$name = $_POST['description'];
$message = $_POST['message'];
$price = $_POST['price'];
$id = $_POST['id'];
$order_no = $_POST['order_no'];
$customer_name = $_POST['customer_name'];
$custname = $_POST['custname'];
$total = $qty * $name * $price;


 mysqli_query($con, "INSERT INTO credit_note (credit_note_number,qty, price, total, Customer_id, customer_name, is_printed, description, message_credit) VALUES ('$order_no','$qty', '$price','$total', '$customer_name','$custname','Yes', '$name','$message')") or die(mysqli_error($con));


echo "<script>document.location='update_credit.php?orderno=$order_no&customer_name=$custname'</script>";
?>
