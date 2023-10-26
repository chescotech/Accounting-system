<?php
error_reporting(E_ALL);
include('../dist/includes/dbcon.php');

if (isset($_POST['manual'])) {
    // Get the data from the form
    $name = $_POST["name"];
    $description = $_POST["description"];
    $price = $_POST["price"];
    $qty = $_POST["qty"];
    $cust_id = $_POST["cust_id"];
    $amount = ($price * $qty);


    $sql = "INSERT INTO credit_temp (name, description, amount, cust_id, qty, price) 
    VALUES ('$description', '$description', '$amount', '$cust_id', '$qty', '$price')";


    if ($con->query($sql) === TRUE) {
        echo "Record inserted successfully.";
    } else {
        echo "Error: " . $con->error;
    }
}
Header("Location: credit_note?order_no=" . $cust_id . "&addtocart=");
