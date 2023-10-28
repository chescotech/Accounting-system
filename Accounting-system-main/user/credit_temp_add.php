<?php
session_start();
error_reporting(E_ALL);
include('../dist/includes/dbcon.php');

if (isset($_POST['addtocart'])) {
    // $prod_name = $_POST['prod_name'];
    $cust_id = $_POST['cid'];
    $qty = $_POST['qty'];
    $price = $_POST['price'];
    // $prod_price = $_POST['prod_price'];
    $prod_id = $_POST['prod_name'];
    echo $cust_id;

    $qtyChecker = mysqli_query($con, "select prod_sell_price,prod_name from product WHERE prod_id='$prod_id'")or die(mysqli_error($con));
    $qtyRows = mysqli_fetch_array($qtyChecker);
    // $qty = $qtyRows['prod_qty'];
    $prod_price = $qtyRows['prod_sell_price'];
    $prod_name = $qtyRows['prod_name'];

    $credprice = $price !== '' ? $price : $prod_price;
    $total = $qty * $credprice; 

    // Check if the product with the same prod_id already exists in the cart
    $checkQuery = "SELECT * FROM credit_temp WHERE prod_id = '$prod_id' AND cust_id = '$cust_id'";
    $checkResult = mysqli_query($con, $checkQuery);

    if (mysqli_num_rows($checkResult) > 0) {
        // Product already exists in the cart, update quantity and total price
        $row = mysqli_fetch_assoc($checkResult);
        $newQty = $row['qty'] + $qty;
        $newTotal = $newQty * $credprice;

        $updateQuery = "UPDATE credit_temp SET qty = '$newQty', amount = '$newTotal' WHERE prod_id = '$prod_id' AND cust_id = '$cust_id'";

        if (mysqli_query($con, $updateQuery)) {
            echo "Product quantity updated successfully.";
        } else {
            echo "Error updating product quantity: " . mysqli_error($con);
        }
    } else {
        // Product doesn't exist in the cart, insert a new row
        $insertQuery = "INSERT INTO credit_temp (name, amount, cust_id, qty, price, description, prod_id) 
                        VALUES ('$prod_name', '$total', '$cust_id', '$qty', '$credprice', '$cus_name', '$prod_id' )";

        if (mysqli_query($con, $insertQuery)) {
            echo "Product added to the cart.";
        } else {
            echo "Error adding product to the cart: " . mysqli_error($con);
        }
    }

    echo $cust_id;

    mysqli_close($con);

    // It's better to use a proper URL and not concatenate data like this, also don't include an empty query parameter
    Header("Location: credit_note?order_no=" . urlencode($cust_id));
    exit();
}
