<?php
include('../dist/includes/dbcon.php');

if (isset($_POST['selectedIds']) && !empty($_POST['selectedIds'])) {
    $selectedIds = $_POST['selectedIds'];

    // Process the selected IDs as needed
    // For example, you can update the database with these IDs
    $updateQuery = "UPDATE contra_transactions SET status = 'Confirmed' WHERE id IN (" . implode(",", $selectedIds) . ")";
    if (mysqli_query($con, $updateQuery)) {
        // Respond with a success message
        echo "Selected transactions completed successfully.";       
    } else {
        // Handle the case where the update query fails
        echo "Error updating transactions: " . mysqli_error($con);
    }
} else {
    // Handle the case where no checkboxes were selected
    echo "No transactions selected.";
}
?>
