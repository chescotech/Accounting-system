<?php

session_start();
if (empty($_SESSION['id'])):
    header('Location:../index.php');
endif;

include('../dist/includes/dbcon.php');

$id = $_GET['id'];

mysqli_query($con, "DELETE FROM bank where id='$id'")or die(mysqli_error($con));

echo "<script type='text/javascript'>alert('Successfully Deleted Item !');</script>";
echo "<script>document.location='view_accounts'</script>";
?>