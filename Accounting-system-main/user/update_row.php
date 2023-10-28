<?php
session_start();

error_reporting(E_ALL);
include('../dist/includes/dbcon.php');

if (isset($_POST['edit_credit'])) {

    $cust_id = $_POST['cust_id'];
    $delete = $_POST['delete'];
    $name = $_POST['name'];
    $description = $_POST['description'];
    $price = $_POST['price'];  
    $qty = $_POST['qty'];  
    $amount = ($price * $qty);                                         ;                                               

    mysqli_query($con, "UPDATE credit_temp SET name='$name', description='$description', amount='$amount', qty='$qty', price='$price' where id='$delete'") or die(mysqli_error($con));
    mysqli_close($con);
}
Header("Location: credit_note?order_no=" . urlencode($cust_id) . "&addtocart=");
exit();
?>
