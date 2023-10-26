<?php
session_start();
error_reporting(E_ALL);
include('../dist/includes/dbcon.php');

if (isset($_POST['addtocart'])) {

    $cust_id = $_POST['cid'];
    $qty = $_POST['qty'];
    $price = $_POST['price'];
    $prod_id = $_POST['prod_name'];
    $cname = $_POST['cname'];
    $credno = $_POST['credno'];
  
    $qtyChecker = mysqli_query($con, "select prod_sell_price,prod_name from product WHERE prod_id='$prod_id'")or die(mysqli_error($con));
    $qtyRows = mysqli_fetch_array($qtyChecker);
   
    $prod_price = $qtyRows['prod_sell_price'];
    $prod_name = $qtyRows['prod_name'];

    $credprice = $price !== '' ? $price : $prod_price;
    $total = $qty * $credprice; 


    $checkQuery = "SELECT * FROM credit_note WHERE prod_id = '$prod_id' AND Customer_id = '$cust_id'";
    $checkResult = mysqli_query($con, $checkQuery);

    if (mysqli_num_rows($checkResult) > 0) {
    
        $row = mysqli_fetch_assoc($checkResult);
        $newQty = $row['qty'] + $qty;
        $newTotal = $newQty * $credprice;

        $updateQuery = "UPDATE credit_note SET qty = '$newQty', price ='$credprice', total = '$newTotal' WHERE prod_id = '$prod_id' AND Customer_id = '$cust_id'";

        if (mysqli_query($con, $updateQuery)) {
            echo "Product quantity updated successfully.";
        } else {
            echo "Error updating product quantity: " . mysqli_error($con);
        }

        $update_query = "UPDATE product SET prod_qty = prod_qty + $qty WHERE prod_id = $prod_id";

        if ($con->query($update_query) === TRUE) {
            echo "Product quantity updated successfully for prod_id: $prod_id\n";
        } else {
            echo "Error updating product quantity for prod_id: $prod_id - " . $con->error . "\n";
        } 
        
    } else {
       
        $insertQuery = "INSERT INTO credit_note(customer_name, total, Customer_id, qty, price, description, prod_id,is_printed,credit_note_number) 
                        VALUES ('$cname', '$total', '$cust_id', '$qty', '$credprice', '$prod_name', '$prod_id','Yes','$credno')";

        if (mysqli_query($con, $insertQuery)) {
            echo "Product added to the cart.";
        } else {
            echo "Error adding product to the cart: " . mysqli_error($con);
        }


        $update_query = "UPDATE product SET prod_qty = prod_qty + $qty WHERE prod_id = $prod_id";

        if ($con->query($update_query) === TRUE) {
            echo "Product quantity updated successfully for prod_id: $prod_id\n";
        } else {
            echo "Error updating product quantity for prod_id: $prod_id - " . $con->error . "\n";
        } 

    }

    mysqli_close($con);

    Header("Location: update_credit.php?orderno=$credno&customer_name=$cname");
    exit();
}
