<?php
session_start();
$id = $_SESSION['id'];
include('../dist/includes/dbcon.php');
include('Classes/DAO.php');
require_once('../PHPmailer/sendmail.php');
error_reporting(E_ALL);

$orderNumber = $_GET['orderno'];

$dao = new DAO();

$query = mysqli_query($con, "SELECT * FROM draft_temp_trans WHERE order_no='$orderNumber' ") or die(mysqli_error($con));
$sales = mysqli_query($con, "SELECT * FROM sales WHERE order_no='$orderNumber' ") or die(mysqli_error($con));
$num_rows = mysqli_num_rows($sales);
while ($row = mysqli_fetch_array($query)) {
    $pid = $row['prod_id'];
    $amount_due = $row['price'];
    $cust_id = $row['cust_id'];
    $tendered = $amount_due;
    $discount = 0;
    $total = $amount_due - $discount;
}
date_default_timezone_set("Africa/Lusaka");
$date = date("Y-m-d");;
$cid = 1;
$branch = $_SESSION['branch'];
$change = 0;
// $payment_mode_id = $_POST['payment_mode_id'];
$invoice_mode = 'download';
$currency = 'ZMW';



if ($num_rows == 0) {

    if ($cust_id == "none") {
        $cust_id = "0";
    }

    mysqli_query($con, "INSERT INTO invoices_tb(order_no) 
                                        VALUES('$orderNumber')") or die(mysqli_error($con));

    $invoice2 = mysqli_query($con, "SELECT MAX(id) AS id FROM invoices_tb") or die(mysqli_error($con));
    $rowss = mysqli_fetch_array($invoice2);
    $invoiceNo = $rowss['id'];

    $id = $_SESSION['id'];

    mysqli_query($con, "INSERT INTO sales(user_id,discount,amount_due,total,date_added,branch_id,order_no,customer_id,invoice_no,modeofpayment) 
	VALUES('$id','$discount','$amount_due','$total','$date','$branch','$orderNumber','$cust_id','$orderNumber','Cash')") or die(mysqli_error($con));

    $sales_id = mysqli_insert_id($con);
    $_SESSION['sid'] = $sales_id;

    $query2 = mysqli_query($con, "SELECT * FROM draft_temp_trans WHERE order_no='$orderNumber' ") or die(mysqli_error($con));
    while ($row2 = mysqli_fetch_array($query2)) {
        $pid = $row2['prod_id'];
        $qty = $row2['qty'];
        $price = $row2['price'];
        $discount_type = $row2['discount_type'];
        $description = $orderNumber;

        $dateis = date('Y-m-d');
        $openClose = mysqli_query($con, "SELECT * FROM open_close_tb WHERE prod_id='$pid' ") or die(mysqli_error($con));
        if (mysqli_num_rows($openClose) > 0) {

            $stockCount = mysqli_query($con, "SELECT * FROM product WHERE prod_id='$pid' ") or die(mysqli_error($con));
            $countRows = mysqli_fetch_array($stockCount);
            $stockOpenBalance = $countRows['prod_qty'];
            $prod_sell_price = $price;

            $dateis = date('Y-m-d');

            mysqli_query($con, "INSERT INTO sales_details(prod_id,qty,price,sales_id,order_no,user_id,discount,discount_type,description)
                VALUES('$pid','$qty','$price','$sales_id','$orderNumber','$id','$discount','$discount_type','invoice no. $description')") or die(mysqli_error($con));
            
                mysqli_query($con, "UPDATE product SET prod_qty=prod_qty-'$qty' where prod_id='$pid' and branch_id='$branch'") or die(mysqli_error($con));


            mysqli_query($con, "UPDATE open_close_tb SET close_bal='$stockOpenBalance'  WHERE date='$dateis' AND prod_id='$pid' ") or die(mysqli_error($con));
        } else {

            $stockCount = mysqli_query($con, "SELECT * FROM product WHERE prod_id='$pid' ") or die(mysqli_error($con));
            $countRows = mysqli_fetch_array($stockCount);
            $prod_sell_price = $countRows['price_sell_price'];
            $stockOpenBalance = $countRows['prod_qty'];
            $dateis = date('Y-m-d');

            mysqli_query($con, "INSERT INTO open_close_tb(prod_id,open_bal,date) 
	VALUES('$pid','$stockOpenBalance','$dateis')") or die(mysqli_error($con));

            mysqli_query($con, "INSERT INTO sales_details(prod_id,qty,price,sales_id,order_no, user_id,discount, discount_type,description)
            VALUES('$pid','$qty','$price','$sales_id','$orderNumber','$id','$discount','$discount_type','invoice no. $description')") or die(mysqli_error($con));


            mysqli_query($con, "UPDATE product SET prod_qty=prod_qty-'$qty' where prod_id='$pid' and branch_id='$branch'") or die(mysqli_error($con));
        }

        $name = mysqli_query($con, "SELECT prod_name FROM product WHERE prod_id='$pid' ") or die(mysqli_error($con));
        $rowz = mysqli_fetch_array($name);
        $prod_name = $rowz['prod_name'];
    }
    $query1 = mysqli_query($con, "SELECT or_no FROM payment NATURAL JOIN sales ORDER BY payment_id DESC LIMIT 0 , 1") or die(mysqli_error($con));

    $row1 = mysqli_fetch_array($query1);
    $or = $row1['or_no'];

    if ($or == 0) {
        $or = 1901;
    } else {
        $or = $or + 1;
    }

    mysqli_query($con, "INSERT INTO payment(cust_id,user_id,payment,payment_date,branch_id,payment_for,due,status,sales_id,or_no) 
	VALUES('$cid','$id','$total','$date','$branch','$date','$total','paid','$sales_id','$or')") or die(mysqli_error($con));

    if ($invoice_mode == "download") {

        echo "<script>document.location='new_reciept.php?order_no=$orderNumber'</script>";
        $result = mysqli_query($con, "DELETE FROM temp_trans where branch_id='$branch' AND user_id='$id'") or die(mysqli_error($con));
    } elseif ($invoice_mode == "note") {
        echo "<script>document.location='delivery-note-new.php?cid=$cid'</script>";
        $result = mysqli_query($con, "DELETE FROM temp_trans where branch_id='$branch' AND user_id='$id'") or die(mysqli_error($con));
    } else if ($invoice_mode == "whatsapp") {

        $itemString = "";
        $total_sales = 0;
        $query = mysqli_query($con, "select * from temp_trans where branch_id='$branch' AND user_id='$id' ") or die(mysqli_error($con));

        while ($row = mysqli_fetch_array($query)) {

            $pid = $row['prod_id'];
            $qty = $row['qty'];
            $price = $row['price'];

            $stockCount = mysqli_query($con, "SELECT * FROM product WHERE prod_id='$pid' ") or die(mysqli_error($con));
            $countRows = mysqli_fetch_array($stockCount);
            $prod_name = $countRows['prod_name'];

            $total_sales += $qty * $price;

            $itemString .= $qty . ' ' . $prod_name . ' , ';
        }

        $validURL = "http://localhost/Accounting/user/invoice?sales_id=" . $sales_id;

        $recieptURL = $msg = "Dear " . $dao->getCustomerNames($cust_id, $con) . ",please find your Reciept of payment at :  " . $validURL . "  from " . $dao->getCompanyName($con) . "  .Thank you for your business. Feel free to contact us on " . $dao->getCompanyContact($con) . " for any queries.";

        $result = mysqli_query($con, "DELETE FROM temp_trans where branch_id='$branch' AND user_id='$id'") or die(mysqli_error($con));
        echo "<script>document.location='http://api.whatsapp.com/send?phone=26" . $dao->getCustomerPhoneNo($cust_id, $con) . "&text=" . urlencode($msg) . " '</script>";
    } else if ($invoice_mode == "email") {
        $itemString = "";
        $total_sales = 0;
        $query = mysqli_query($con, "select * from temp_trans where branch_id='$branch' AND user_id='$id' ") or die(mysqli_error($con));

        while ($row = mysqli_fetch_array($query)) {

            $pid = $row['prod_id'];
            $qty = $row['qty'];
            $price = $row['price'];

            $stockCount = mysqli_query($con, "SELECT * FROM product WHERE prod_id='$pid' ") or die(mysqli_error($con));
            $countRows = mysqli_fetch_array($stockCount);
            $prod_name = $countRows['prod_name'];

            $total_sales += $qty * $price;

            $itemString .= $qty . ' ' . $prod_name . ' , ';
        }

        $em = new email();
        //$dao->getCustomerEmail($cust_id, $con)
        $validURL = "http://localhost/Accounting/user/invoice?sales_id=" . $sales_id;
        $image = '<img src="shazz_logo.jpg" width="200px" height="200px" class="img-thumbnail" />';

        $msg = "Dear " . $dao->getCustomerNames($cust_id, $con) . ", <br> </br> <br> </br>
        please find your Reciept of payment at : " . $validURL . "  from " . $dao->getCompanyName($con) . " .         
        Thank you for shopping with us. Feel free to contact us on 0967962090 for any queries." . "<br>" . "<br>"
            . "© 2021 Chesco-Tech. All rights reserved. This invoice was sent through Chesco-Tech Accounting Software.";

        $em->send_mail($dao->getCustomerEmail($cust_id, $con), $msg, "PAYMENT RECIEPT", $dao->getCompanyName($con));


        echo "<script type='text/javascript'>alert('Successfully Transacted');</script>";
        echo "<script>document.location='select_customer.php'</script>";
    }
} else {
    // echo $pid;
    echo "<script type='text/javascript'>alert(' Error receipt Already exists');</script>";
    echo "<script>document.location='draft-sale.php'</script>";
}
