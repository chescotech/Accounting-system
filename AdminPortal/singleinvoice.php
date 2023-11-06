<?php
session_start();
$id = $_SESSION['id'];
include('../dist/includes/dbcon.php');

$discount = 0;
$amount_due_current = $_POST['total_price'];
$draftID = $_POST['row_id'];
$cid = $_POST['row_id'];
$tender = $_POST['tender'];
$new_total = $_POST['total_price'];
$orderNumber = $_POST['invoice_number'];
$cust_name = $_POST['customer_name'];
$payment_mode_id = $_POST['payment_mode_id'];
$pay_acc_id = $_POST['pa'];


$pay = mysqli_query($con, "SELECT * FROM payment_account WHERE id = '$pay_acc_id'") or die(mysqli_error($con));
$low = mysqli_fetch_assoc($pay);
$balance = $low['balance'];


mysqli_query($con, "INSERT INTO supplier_part_payments(supplier_payment_id,amount) 
        VALUES('$cid','$tender')") or die(mysqli_error($con));

$query = mysqli_query($con, "SELECT * FROM supplier_payments_tb WHERE payment_id='$cid'") or die(mysqli_error($con));
while ($row = mysqli_fetch_array($query)) {
    $amount_due = $row['total_amount'];
    $balance_s = $row['balance'];
    $amount_paid = $row['amount_paid'];

    $new_balance = $balance_s - $tender;
    $new_amount = $amount_paid + $tender;
    
    if ($tender < $amount_due_current) {
        
        mysqli_query($con, "UPDATE supplier_payments_tb SET balance = '$new_balance', amount_paid = '$new_amount' WHERE payment_id = '$cid'") or die(mysqli_error($con));
    } else {
        mysqli_query($con, "UPDATE supplier_payments_tb SET balance = '$new_balance', amount_paid = '$new_amount', status = 'Paid' WHERE payment_id = '$cid'") or die(mysqli_error($con));
    }
}
$update = mysqli_query($con, "UPDATE payment_account SET balance = balance - '$tender' WHERE id = '$pay_acc_id'") or die(mysqli_error($con));
echo "<script>document.location='supplier_payments.php'</script>";
