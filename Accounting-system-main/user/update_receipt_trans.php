<?php
session_start();

if (empty($_SESSION['id'])) {
    header('Location:../index.php');
    exit;
}

include('../dist/includes/dbcon.php');

$id = $_POST['id'];
$description = $_POST['description'];
$price = $_POST['price'];

// Update sales_details
mysqli_query($con, "UPDATE sales_details SET price='$price', description = '$description' WHERE sales_details_id='$id'") or die(mysqli_error($con));

// Calculate the total amount for the given $sid
$sid = $_POST['sid'];
$result = mysqli_query($con, "SELECT SUM(price) AS total_amount FROM sales_details WHERE sales_id = '$sid'");
$row = mysqli_fetch_assoc($result);
$total_amount = $row['total_amount'];

// Update the total column in the sales table
mysqli_query($con, "UPDATE sales SET total='$total_amount' WHERE sales_id='$sid'") or die(mysqli_error($con));

echo "<script>document.location='sales_receipt_draft.php'</script>";
?>
