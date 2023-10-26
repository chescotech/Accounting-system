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
$qty = $_POST['qty'];
$total = $price * $qty;

mysqli_query($con, "UPDATE credit_note SET price='$price',total = '$total', qty = '$qty', description = '$description' WHERE credit_id='$id'") or die(mysqli_error($con));

echo "<script>document.location='credit_draft.php'</script>";
?>
