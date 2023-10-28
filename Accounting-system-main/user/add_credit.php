<?php
// Include the database connection file
include('../dist/includes/dbcon.php');

// Check if required POST variables are set
if (!isset($_POST['CNO'], $_POST['selected_cust_id'], $_POST['date'], $_POST['email'], $_POST['billing_address'], $_POST['message_statement'], $_POST['message_credit_note'])) {
    // Handle missing POST variables
    header("Location: credit_note.php?status=error&message=Missing POST data");
    exit();
}

$creditNoEscaped = $_POST['CNO']; // Assuming 'CNO' is the name attribute of the input field
$customerName = $_POST['selected_cust_id']; // Assuming 'selected_cust_id' is the name attribute of the select field
$date = $_POST['date'];
$email = $_POST['email'];
$billingAddress = $_POST['billing_address'];
$messageStatement = $_POST['message_statement'];
$messageCreditNote = $_POST['message_credit_note'];

// Now, let's retrieve the order_no from draft_temp_trans
$selectOrderNoQuery = "SELECT * FROM draft_temp_trans WHERE order_no = '$creditNoEscaped'";

// Execute the query to retrieve order_no
$result = mysqli_query($con, $selectOrderNoQuery);

if ($result) {
    // Check if any rows were returned
    if ($row = mysqli_fetch_assoc($result)) {
        $orderNo = $row['order_no'];
        $prod_id = $row['prod_id'];
        $price = $row['price'];
        $qty = $row['qty'];

        $total = $qty * $price;

        if (!empty($_FILES['file']['name'])) {
            $upload_id = round(microtime(true) * 1000);
            $file = $upload_id . "-" . $_FILES['file']['name'];
            $file_loc = $_FILES['file']['tmp_name'];
            $file_size = $_FILES['file']['size'];
            $file_type = $_FILES['file']['type'];
            $folder = "../Objects/";

            $Image_size = $_FILES['file']['size'];
            $Image_type = $_FILES['file']['type'];
            $Image_folder = "../Objects/";

            $new_size = $file_size / 1024000;
            $image_size = $file_size / 1024000;

            $new_file_name = strtolower($file);

            $Certificate = str_replace(' ', '-', $new_file_name);

            if (move_uploaded_file($file_loc, $folder . $Certificate)) {
                mysqli_query($con, "INSERT INTO credit_note (invoice_no, customer_id, date, email, billing_address, message_statement, message_credit_note, prod_id, qty, price, total, Attachment)
                VALUES('$creditNoEscaped', '$customerName', '$date', '$email', '$billingAddress', '$messageStatement', '$messageCreditNote', '$prod_id', '$qty', '$price', '$total','$Certificate')" )or die(mysqli_error($con));

            } else {
                // Handle file upload failure
                header("Location: credit_note.php?status=error&message=File upload failed");
                exit();
            }
        } else {    
            // Handle case where file is not uploaded
            header("Location: credit_note.php?status=error&message=No file uploaded");
            exit();        
        }
        $insertCreditNoteQuery = "INSERT INTO credit_note (invoice_no, customer_id, date, email, billing_address, message_statement, message_credit_note, prod_id, qty, price, total)
            VALUES('$creditNoEscaped', '$customerName', '$date', '$email', '$billingAddress', '$messageStatement', '$messageCreditNote', '$prod_id', '$qty', '$price', '$total')" ;
        // Perform the insertion into credit_note
        if (mysqli_query($con, $insertCreditNoteQuery)) {
            // Insertion into credit_note successful, now delete from draft_temp_trans
            $deleteFromDraftQuery = "DELETE FROM draft_temp_trans WHERE order_no = '$creditNoEscaped'";
                
            // Perform the deletion from draft_temp_trans
            if (mysqli_query($con, $deleteFromDraftQuery)) {
                // Deletion from draft_temp_trans successful
                // Redirect to credit_note.php with success status
                header("Location: credit_note.php?status=success");
                exit();
            } else {
                // Handle deletion failure
                header("Location: credit_note.php?status=error&message=Deletion from draft_temp_trans failed");
                exit();
            }
        } else {
            // Handle insertion failure
            header("Location: credit_note.php?status=error&message=Insertion into credit_note failed");
            exit();
        }
    } else {
        // Handle case where no order_no is found
        header("Location: credit_note.php?status=error&message=No order_no found");
        exit();
    }
} else {
    // Handle query execution failure
    header("Location: credit_note.php?status=error&message=Query execution failed");
    exit();
} 


// Close the database connection
mysqli_close($con);
