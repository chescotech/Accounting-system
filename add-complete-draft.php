<?php

session_start();
$id = $_SESSION['id'];
include('../dist/includes/dbcon.php');

$discount = $_POST['discount'];
$amount_due = $_POST['amount_due'];
$date = date("Y-m-d H:i:s");
$cid = $_REQUEST['cid'];
$branch = $_SESSION['branch'];
$total = $amount_due - $discount;
$new_total = $_POST['new_total'];
$cid = $_REQUEST['cid'];
$orderNumber = $_POST['orderno']; //(rand(50, 5000));


$bank_id = $_POST['selected_bank'];
$bank_acc = $_POST['selected_account'];
$payacc = $_POST['payment_account'];
$price = $_POST['total'];

$bankquery = mysqli_query($con, "SELECT * FROM bank WHERE id='$bank_id'") or die(mysqli_error($con));
$brow = mysqli_fetch_array($bankquery);
$bank_name = $brow['bank_name'];


$tendered = $_POST['amount_due'];
$change = $_POST['change'];
$cust_name = $_POST['cust_name'];
$payment_mode_id = $_POST['payment_mode_id'];

if ($tendered >= $amount_due) {
    mysqli_query($con, "INSERT INTO sales(customer_id,user_id,discount,amount_due,total,date_added,modeofpayment,balance,branch_id,order_no,invoice_no) 
	VALUES('$cust_name','$id','$discount','$amount_due','$new_total','$date','$payment_mode_id','$change','$branch','$orderNumber','$orderNumber')")or die(mysqli_error($con));
    $sales_id = mysqli_insert_id($con);

    // Now $sales_id contains the sales_id value
    // echo "Inserted record with sales_id: $sales_id";

        mysqli_query($con, "INSERT INTO contra_transactions (debit, transaction_type, description, transaction_id, bank_id, bank_name, bank_account_name, account_name) "
    . "VALUES ('$price', 'Invoice', 'Invoice. $orderNumber', '$orderNumber', '$bank_id', '$bank_name', '$bank_acc', '$payacc')") or die(mysqli_error($con));

    mysqli_query($con, "UPDATE bank SET debit = debit + $price, total = total + $price WHERE id = $bank_id") or die(mysqli_error($con));

    
    $_SESSION['sid'] = $sales_id;

    

    $query = mysqli_query($con, "select * from draft_temp_trans where branch_id='$branch' AND order_no='$orderNumber' ")or die(mysqli_error($con));
    while ($row = mysqli_fetch_array($query)) {
        
        $pid = $row['prod_id'];
        $qty = $row['qty'];
        $price = $row['price'];
        $description = $row['description'];

        $discount = $row['amount'];
        $discount_type = $row['discount_type'];        
        $dateis = date('Y-m-d');
        $openClose = mysqli_query($con, "SELECT * FROM open_close_tb WHERE prod_id='$pid' AND date='$dateis' ")or die(mysqli_error($con));
        if (mysqli_num_rows($openClose) > 0) {
            
            // product already exisits so just update the close balance.. 
            // get the stock count from inventory.. 
            $stockCount = mysqli_query($con, "SELECT * FROM product WHERE prod_id='$pid' ")or die(mysqli_error($con));
            $countRows = mysqli_fetch_array($stockCount);
            $stockOpenBalance = $countRows['prod_qty'];
            $prod_sell_price = $countRows['prod_sell_price'];
            $dateis = date('Y-m-d');

            mysqli_query($con, "INSERT INTO sales_details(prod_id,qty,price,sales_id,order_no,description,user_id,discount,discount_type) "
                            . "VALUES('$pid','$qty','$price','$sales_id','$orderNumber','$description','$id','$discount','$discount_type')")or die(mysqli_error($con));
           
                        
            // update the closing balance for the stock.. 
            mysqli_query($con, "UPDATE open_close_tb SET close_bal='$stockOpenBalance'  WHERE date='$dateis' AND prod_id='$pid' ")or die(mysqli_error($con));
        } else {
            // get the stock count from inventory.. 
            $stockCount = mysqli_query($con, "SELECT * FROM product WHERE prod_id='$pid' ")or die(mysqli_error($con));
            $countRows = mysqli_fetch_array($stockCount);
            $stockOpenBalance = $countRows['prod_qty'];
            $prod_sell_price = $countRows['prod_sell_price'];
            $dateis = date('Y-m-d');

            mysqli_query($con, "INSERT INTO open_close_tb(prod_id,open_bal,date) 
	VALUES('$pid','$stockOpenBalance','$dateis')")or die(mysqli_error($con));

            mysqli_query($con, "INSERT INTO sales_details(prod_id,qty,price,sales_id,order_no,description,user_id,discount,discount_type) "
                            . "VALUES('$pid','$qty','$price','$sales_id','$orderNumber','$description','$id','$discount','$discount_type')")or die(mysqli_error($con));
            //mysqli_query($con, "UPDATE product SET prod_qty=prod_qty-'$qty' where prod_id='$pid' and branch_id='$branch'") or die(mysqli_error($con));
        }

        // update the inventory counts.. 
    }

    $query1 = mysqli_query($con, "SELECT or_no FROM payment NATURAL JOIN sales WHERE modeofpayment =  'cash' ORDER BY payment_id DESC LIMIT 0 , 1")or die(mysqli_error($con));

    $row1 = mysqli_fetch_array($query1);
    $or = $row1['or_no'];

    if ($or == 0) {
        $or = 1901;
    } else {
        $or = $or + 1;
    }

    mysqli_query($con, "INSERT INTO payment(cust_id,user_id,payment,payment_date,branch_id,payment_for,due,status,sales_id,or_no) 
	VALUES('$cid','$id','$total','$date','$branch','$date','$total','paid','$sales_id','$or')")or die(mysqli_error($con));

    $result = mysqli_query($con, "DELETE FROM draft_temp_trans where branch_id='$branch' AND order_no='$orderNumber' ") or die(mysqli_error($con));
    //  echo $sales_id;
    echo "<script>document.location='draft-reciept.php?orderno=$orderNumber&sales_id=$sales_id'</script>";
} else {
    echo "<script type='text/javascript'>alert(' Error !!, Cash Tendered cannot be less than amount due..');</script>";
    echo "<script>document.location='draft-sale.php.php?orderno=$orderNumber'</script>";
}
?>

