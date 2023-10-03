<?php

session_start();
if (empty($_SESSION['id'])):
    header('Location:../index.php');
endif;

include('../dist/includes/dbcon.php');
$id = $_POST['id'];
$description = $_POST['description'];
$amount = $_POST['amount'];

$category = $_POST['category'];
$pay = $_POST['pay'];
// $date =  date('Y-m-d H:i:s');

mysqli_query($con, "UPDATE expenses_tb SET description='$description', amount='$amount', category='$category' , payment_method='$pay' WHERE id='$id'") or die(mysqli_error($con));


echo "<script type='text/javascript'>alert('Successfully updated details!');</script>";
echo "<script>document.location='expenses.php'</script>";
?>
