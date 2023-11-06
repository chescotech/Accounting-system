<?php
error_reporting(E_ALL);
include('../dist/includes/dbcon.php');


function generateUniqueCreditNoteNumber($con)
{
    $creditNotenum = rand(10, 100);

    $query = "SELECT credit_note_number FROM credit_note WHERE credit_note_number = '$creditNotenum'";
    $result = $con->query($query);

    while ($result->num_rows > 0) {
        $creditNotenum = rand(10, 100);
        $query = "SELECT credit_note_number FROM credit_note WHERE credit_note_number = '$creditNotenum'";
        $result = $con->query($query);
    }

    return $creditNotenum;
}


$query = "SELECT name, description, amount, invoice_no, invoice_id, cust_id, qty, prod_id, price FROM credit_temp";
$result = $con->query($query);

$ms = $_POST['ms'];
$mc = $_POST['mc'];
$bank_id = $_POST['selected_bank'];
$bank_acc = $_POST['selected_account'];
$payacc = $_POST['payment_account'];


$bankquery = mysqli_query($con, "SELECT * FROM bank WHERE id='$bank_id'") or die(mysqli_error($con));
$brow = mysqli_fetch_array($bankquery);
$bank_name = $brow['bank_name'];

$creditNotenum = generateUniqueCreditNoteNumber($con);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $invoice_no = $row['invoice_no'];
        $total = $row['amount'];
        $prodid = $row['prod_id'];
        $message_statement = $row['name'];
        $invoice_id = $row['invoice_id'];
        $customer_id = $row['cust_id'];
        $qty = $row['qty'];
        $price = $row['price'];

        $query2 = mysqli_query($con, "SELECT cust_first FROM customer WHERE cust_id='$customer_id'") or die(mysqli_error($con));
        $rowx = mysqli_fetch_array($query2);
        $customer_name = $rowx['cust_first'];


        $update_query = "UPDATE product SET prod_qty = prod_qty + $qty WHERE prod_id = $prodid";

        if ($con->query($update_query) === TRUE) {
            echo "Product quantity updated successfully for prod_id: $prodid\n";
        } else {
            echo "Error updating product quantity for prod_id: $prodid - " . $con->error . "\n";
        }

        $insert_query = "INSERT INTO credit_note (invoice_no, total, description, invoice_id, customer_id, customer_name, complete_message_statement, message_credit, qty, price, credit_note_number, prod_id) "
            . "VALUES ('$invoice_no', '$total', '$message_statement', '$invoice_id', '$customer_id', '$customer_name', '$ms', '$mc', '$qty', '$price', '$creditNotenum', '$prodid')";

        // Your initial insert query
        if ($con->query($insert_query) === TRUE) {
            echo "Data inserted successfully for invoice number: $invoice_no\n";

            // Define the contra insert query
            $contra = "INSERT INTO contra_transactions (debit, transaction_type, description, transaction_id, bank_id, bank_name, bank_account_name, account_name) "
                . "VALUES ('$price', 'Credit Note', '$message_statement', '$invoice_no', '$bank_id', '$bank_name', '$bank_acc', '$payacc')";

            // Execute the contra insert query
            if ($con->query($contra) === TRUE) {
                echo "Contra transaction inserted successfully.\n";

                // Define the update query for the bank table
                $update_contra = "UPDATE bank SET debit = debit + $price, total = total - $price WHERE id = $bank_id";

                // Execute the update query for the bank table
                if ($con->query($update_contra) === TRUE) {
                    echo "Bank record updated successfully.\n";
                } else {
                    echo "Error updating bank record - " . $con->error . "\n";
                }
            } else {
                echo "Error inserting data into contra_transactions - " . $con->error . "\n";
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

Header("Location: credit-note.php?order_no=" . $customer_id . "&addtocart=");
exit();


?>