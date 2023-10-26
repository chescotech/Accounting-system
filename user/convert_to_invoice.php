<?php

session_start();
$id = $_SESSION['id'];
include('../dist/includes/dbcon.php');
include('Classes/DAO.php');

$DAO = new DAO();

$custId = $_GET['cust_id'];
$customer_name = $DAO->getCustomerNames($custId, $con);
$today = date("Y-m-d");
$date2collect = $today;
$orderNumber = (rand(50, 5000));
$branch = $_SESSION['branch'];
// $description = $_POST['description'];
$quote_id = $_GET['quote_id'];

$query2 = mysqli_query($con, "select * from customer WHERE cust_id='$custId' ") or die(mysqli_error($con));
$row = mysqli_fetch_array($query2);



mysqli_query($con, "INSERT INTO invoices_tb(order_no) 
 VALUES('$orderNumber')") or die(mysqli_error($con));

$invoice2 = mysqli_query($con, "SELECT MAX(id) AS id FROM invoices_tb") or die(mysqli_error($con));
$rowss = mysqli_fetch_array($invoice2);
$invoiceNo = $rowss['id'];


$checker_ = mysqli_query($con, "SELECT * FROM quotation_tb WHERE quote_identity = '$quote_id'") or die(mysqli_error($con));
$checker_2 = mysqli_query($con, "SELECT * FROM draft_temp_trans WHERE quote_id = '$quote_id'") or die(mysqli_error($con));

if (mysqli_num_rows($checker_2) > 0) {    
    echo "<script type='text/javascript'>alert(' Invoice already exists !!..');</script>";
    echo "<script>document.location='quotations.php'</script>";

} else {
    while ($row_ = mysqli_fetch_array($checker_)) {
        $pid = $row_['prod_id'];
        $qty = $row_['qty'];
        $price = $row_['price'];
        $custId = $row_['customer'];

        mysqli_query($con, "UPDATE product SET prod_qty = prod_qty - '$qty' WHERE prod_id = '$pid' AND branch_id = '$branch'") or die(mysqli_error($con));

        mysqli_query($con, "INSERT INTO draft_temp_trans(order_no, customer_name, cust_id, date2collect, updated, qty, price, prod_id, is_printed, quote_id) VALUES ('$invoiceNo', '$customer_name', '$custId', '$date2collect', '$today', '$qty', '$price', '$pid', 'Yes', '$quote_id')") or die(mysqli_error($con));
    }
}
echo "<script type='text/javascript'>alert(' Converting Saved Successfully !!..');</script>";
echo "<script>document.location='incomplete-draft-reciept.php?orderno=$invoiceNo'</script>";
