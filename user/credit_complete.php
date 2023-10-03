<?php
error_reporting(E_ALL);
include('../dist/includes/dbcon.php');

// Fetch data from the credit_temp table
$query = "SELECT name, description, amount, invoice_no, invoice_id, cust_id, qty, price, prod_id FROM credit_temp";
$result = $con->query($query);

$ms = $_POST['ms'];
$mc = $_POST['mc'];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $invoice_no = $row['invoice_no'];
        $total = $row['amount'];
        $message_statement = $row['description'];
        $invoice_id = $row['invoice_id'];
        $customer_id = $row['cust_id'];
        $prod_id = $row['prod_id'];
        $customer_name = $row['name'];
        $qty = $row['qty'];
        $price = $row['price'];

        $insert_query = "INSERT INTO credit_note (invoice_no, total, description, invoice_id, customer_id, customer_name,complete_message_statement,message_credit,qty,price ) VALUES ('$invoice_no', '$total', '$message_statement', '$invoice_id', '$customer_id', '$customer_name','$mc','$ms','$qty','$price')";
        
        if ($con->query($insert_query) === TRUE) {
            echo "Data inserted successfully for invoice number: $invoice_no\n";

            $update = "UPDATE product SET prod_qty = prod_qty + $qty WHERE prod_id = '$prod_id'";
             
            if ($con->query($update) === TRUE) {
                echo "Row updated from credit_temp for invoice number: $invoice_no\n";
            } else {
                echo "Error updating row from credit_temp for invoice number: $invoice_no - " . $con->error . "\n";
            }

            // After successful insertion, delete the row from credit_temp
            $delete_query = "DELETE FROM credit_temp WHERE invoice_no = '$invoice_no'";
            if ($con->query($delete_query) === TRUE) {
                echo "Row deleted from credit_temp for invoice number: $invoice_no\n";
            } else {
                echo "Error deleting row from credit_temp for invoice number: $invoice_no - " . $con->error . "\n";
            }
        } else {
            echo "Error inserting data for invoice number: $invoice_no - " . $con->error . "\n";
        }
    }
} else {
    echo "No data found in the credit_temp table.\n";
}

Header("Location: credit_note?order_no=" . $customer_id . "&addtocart=");
exit();
?>
