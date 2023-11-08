<?php 

include('../dist/includes/dbcon.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['transaction_ids'])) {
        foreach ($_POST['transaction_ids'] as $transactionId) {
            // Update the status in the 'contra_transactions' table
            $updateQuery = "UPDATE contra_transactions SET status = 'Confirmed' WHERE transaction_id = '$transactionId'";
            if (mysqli_query($con, $updateQuery)) {
                // Update was successful
            } else {
                // Handle the case where the update failed
                echo "Update failed: " . mysqli_error($con);
            }
        }
        header("Location: your_original_page.php");
    } else {
        // Handle the case where no transaction IDs were sent
        echo "No transaction IDs provided for confirmation.";
    }
} else {
    // Handle invalid requests
    echo "Invalid request method.";
}

?>