<?php
include('../dist/includes/dbcon.php');

$total_amount = $_POST['total_amount'];
$amount_paid = $_POST['amount_paid'];
$supplier_id = $_POST['supplier'];
$invoice_no = $_POST['invoice_no'];
$balance = $total_amount - $amount_paid;

$bank_id = $_POST['selected_bank'];
$bank_acc = $_POST['selected_account'];
$payacc = $_POST['payment_account'];
$price = $_POST['amount_paid'];

$bankquery = mysqli_query($con, "SELECT * FROM bank WHERE id='$bank_id'") or die(mysqli_error($con));
$brow = mysqli_fetch_array($bankquery);
$bank_name = $brow['bank_name'];

mysqli_query($con, "INSERT INTO contra_transactions (debit, transaction_type, description, transaction_id, bank_id, bank_name, bank_account_name, account_name) "
. "VALUES ('$price', 'Payment', 'Payment. $invoice_no', '$orderNumber', '$bank_id', '$bank_name', '$bank_acc', '$payacc')") or die(mysqli_error($con));

mysqli_query($con, "UPDATE bank SET debit = debit + $price, total = total - $price WHERE id = $bank_id") or die(mysqli_error($con));

mysqli_query($con, "INSERT INTO supplier_payments_tb(total_amount,amount_paid,supplier_id,invoice_no,balance) 
				VALUES('$total_amount','$amount_paid','$supplier_id','$invoice_no','$balance')")or die(mysqli_error($con));

echo "<script type='text/javascript'>alert('Successfully added Record!');</script>";
echo "<script>document.location='supplier_payments.php'</script>";
?>