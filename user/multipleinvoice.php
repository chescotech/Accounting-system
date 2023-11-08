<?php
session_start();
$id = $_SESSION['id'];
include('../dist/includes/dbcon.php');
error_reporting(0);

$discount = 0;
$cust_name = $_POST['customer_name'];
$payment_mode_id = $_POST['payment_mode_id'];
$pay_acc_id = $_POST['pa'];
$grandtotal = $_POST['grandTotal'];
$selectedIds = explode(',', $_POST['selectedIds']);
$selectedInvoiceNumbers = explode(',', $_POST['selectedInvoiceNumbers']);
$pay = mysqli_query($con, "SELECT * FROM payment_account WHERE id = '$pay_acc_id'") or die(mysqli_error($con));
$low = mysqli_fetch_assoc($pay);
$balance = $low['balance'];

$bank_id = $_POST['selected_bank'];
$bank_acc = $_POST['selected_account'];
$payacc = $_POST['pa'];
$price = $_POST['total_price_'];

$bankquery = mysqli_query($con, "SELECT * FROM bank WHERE id='$bank_id'") or die(mysqli_error($con));
$brow = mysqli_fetch_array($bankquery);
$bank_name = $brow['bank_name'];


foreach ($selectedIds as $key => $draftID) {
    $amount_due = $_POST['total_price_' . $draftID];
    $date = date("Y-m-d H:i:s");
    $cid = $_REQUEST['cid'];
    $branch = $_SESSION['branch'];

    $total = $amount_due - $discount;
    $new_total = $_POST['total_price_' . $draftID];

    $orderNumber = $selectedInvoiceNumbers[$key];
    $deposit = $new_total; // Use the total price as the deposit
       

    if ($deposit >= $amount_due) {
        $totalPrice =0; 
        // Query for the row with the specified temp_trans_id and the same order_no
        $query = mysqli_query($con, "SELECT * FROM draft_temp_trans WHERE branch_id='$branch' AND order_no='$orderNumber'") or die(mysqli_error($con));
        while ($row = mysqli_fetch_array($query)) {
            $pid = $row['prod_id'];
            $qty = $row['qty'];
            $price = $row['price'];
            $description = $row['description'];
            $discount = $row['amount'];
            $discount_type = $row['discount_type'];
            $total_amount = $price * $qty;


            // Insert data for the selected row into the sales table
            mysqli_query($con, "INSERT INTO sales(customer_id,user_id,discount,amount_due,total,date_added,modeofpayment,branch_id,order_no,pay_acc_id,balance) 
            VALUES('$cid','$id','$discount','$price','$total_amount','$date','$payment_mode_id','$branch','$orderNumber','$pay_acc_id','$balance')") or die(mysqli_error($con));

            $balance += $price;

            $totalPrice += $price;

            $sales_id = mysqli_insert_id($con);
            $_SESSION['sid'] = $sales_id;

            // Update the open_close_tb table (close_bal field) for the stock
            $stockCount = mysqli_query($con, "SELECT * FROM product WHERE prod_id='$pid' ") or die(mysqli_error($con));
            $countRows = mysqli_fetch_array($stockCount);
            $stockOpenBalance = $countRows['prod_qty'];
            $prod_sell_price = $countRows['prod_sell_price'];
            $dateis = date('Y-m-d');
            mysqli_query($con, "UPDATE open_close_tb SET close_bal='$stockOpenBalance'  WHERE date='$dateis' AND prod_id='$pid' ") or die(mysqli_error($con));

            // Insert sales details for the selected row
            mysqli_query($con, "INSERT INTO sales_details(prod_id,qty,price,sales_id,order_no,description,user_id,discount,discount_type) "
                . "VALUES('$pid','$qty','$price','$sales_id','$orderNumber','$description','$id','$discount','$discount_type')") or die(mysqli_error($con));
                
                mysqli_query($con, "INSERT INTO contra_transactions (debit, transaction_type, description, transaction_id, bank_id, bank_name, bank_account_name, account_name) "
                . "VALUES ('$price', 'Invoice', 'Invoice. $orderNumber', '$orderNumber', '$bank_id', '$bank_name', '$bank_acc', '$payacc')") or die(mysqli_error($con));

                
                mysqli_query($con, "UPDATE bank SET debit = debit + '$price', total = total + '$price' WHERE id = '$bank_id'") or die(mysqli_error($con));


                // Delete only the row with the specified temp_trans_id
            }
            
            
        }
        
        
    }
    
$deleteQuery = mysqli_query($con, "DELETE FROM draft_temp_trans WHERE branch_id='$branch' AND order_no='$orderNumber'") or die(mysqli_error($con));

$update = mysqli_query($con, "UPDATE payment_account SET balance = balance + '$grandtotal' WHERE id = '$pay_acc_id'") or die(mysqli_error($con));
echo "<script>document.location='draft-reciept.php'</script>";
