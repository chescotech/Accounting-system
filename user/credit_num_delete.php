<?php
error_reporting(E_ALL);
session_start();
$id2 = $_SESSION['id'];
$branch = $_SESSION['branch'];
include('../dist/includes/dbcon.php');

$id = $_GET['id'];


 mysqli_query($con, "DELETE FROM credit_note WHERE credit_note_number = '$id'") or die(mysqli_error($con));


echo "<script>document.location='credit_draft'</script>";
?>
