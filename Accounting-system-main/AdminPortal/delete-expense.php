<?php

session_start();
if (empty($_SESSION['id'])):
    header('Location:../index.php');
endif;

include('../dist/includes/dbcon.php');

$id = $_POST['id'];
mysqli_query($con, "DELETE FROM expenses_tb where id ='$id'")or die(mysqli_error($con));

echo "<script type='text/javascript'>alert('Successfully Deleted Record !!');</script>";
echo "<script>document.location='expenses'</script>";
?>
