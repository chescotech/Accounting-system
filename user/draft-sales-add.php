<?php

session_start();
$id = $_SESSION['id'];
include('../dist/includes/dbcon.php');
include('Classes/DAO.php');

$DAO = new DAO();

$customer_name = $DAO->getCustomerNames($_SESSION['selected_cust_id'], $con);
$date2collect = $_POST['date2collect'];
$orderNumber = (rand(50, 5000));
$branch = $_SESSION['branch'];
$description = $_POST['description'];
$today = date("Y-m-d");


// $bank_id = $_POST['selected_bank'];
// $bank_acc = $_POST['selected_account'];
// $payacc = $_POST['payment_account'];
// $price = $_POST['total'];


// $bankquery = mysqli_query($con, "SELECT * FROM bank WHERE id='$bank_id'") or die(mysqli_error($con));
// $brow = mysqli_fetch_array($bankquery);
// $bank_name = $brow['bank_name'];

// update the inventory draft sales record ... 

 $query2=mysqli_query($con,"select * from customer WHERE cust_first='$customer_name' ")or die(mysqli_error($con));
 $row=mysqli_fetch_array($query2);
 $custId = $row['cust_id'];


 mysqli_query($con, "INSERT INTO invoices_tb(order_no) 
 VALUES('$orderNumber')")or die(mysqli_error($con));

$invoice2 = mysqli_query($con, "SELECT MAX(id) AS id FROM invoices_tb")or die(mysqli_error($con));
$rowss = mysqli_fetch_array($invoice2);
$invoiceNo = $rowss['id'];


/*
$checker = mysqli_query($con, "SELECT * FROM draft_temp_trans WHERE customer_name='$customer_name'") or die(mysqli_error($con));
if (mysqli_num_rows($checker) > 0) {
    echo "<script type='text/javascript'>alert(' Error, there is already a credit record on this customer !!..');</script>";
    echo "<script>document.location='draft-sale'</script>";
} else {

    */

    // loop thru the credit sales and update the quanties in stock..
    $checker_ = mysqli_query($con, "SELECT * FROM draft_temp_trans WHERE order_no='0'  ") or die(mysqli_error($con));
    while ($row_ = mysqli_fetch_array($checker_)) {
        $pid = $row_['prod_id'];
        $qty = $row_['qty'];

        mysqli_query($con, "UPDATE product SET prod_qty=prod_qty-'$qty' where prod_id='$pid' and branch_id='$branch'") or die(mysqli_error($con));


        mysqli_query($con, "UPDATE draft_temp_trans SET order_no='$invoiceNo',customer_name='$customer_name',description='$description',cust_id='$custId', date2collect = '$date2collect', updated= '$today' where order_no='0'") or die(mysqli_error($con));
        
    }

    // mysqli_query($con, "INSERT INTO contra_transactions (credit, transaction_type, description, transaction_id, bank_id, bank_name, bank_account_name, account_name) "
    // . "VALUES ('$price', 'Invoice', 'Invoice. $orderNumber', '$orderNumber', '$bank_id', '$bank_name', '$bank_acc', '$payacc')") or die(mysqli_error($con));


    // mysqli_query($con, "UPDATE bank SET credit = credit + $price, total = total + $price WHERE id = $bank_id") or die(mysqli_error($con));

    echo "<script type='text/javascript'>alert(' Draft Record Saved Successfully !!..');</script>";
    echo "<script>document.location='draft-sale'</script>";

?>