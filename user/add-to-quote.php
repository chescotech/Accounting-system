<?php

session_start();
$id = $_SESSION['id'];
$branch = $_SESSION['branch'];

include('../dist/includes/dbcon.php');

// check if barcode has been used or not.. 

$user_id = $_SESSION['id'];
$qty = $_POST['qty'];
$name = $_POST['description'];
$price = $_POST['price'];

$query1 = mysqli_query($con, "select * from quotation_tb where description='$name'")or die(mysqli_error($con));
$count = mysqli_num_rows($query1);

//$total = $price * $qty;

if ($count > 0) {
    mysqli_query($con, "update quotation_tb set qty=qty+'$qty' where description='$name'")or die(mysqli_error($con));
} else {
   // mysqli_query($con, "INSERT INTO draft_temp_trans(prod_id,qty,price,branch_id,user_id,description) VALUES('0','$qty','$price','$branch','$user_id','$name')")or die(mysqli_error($con));

    mysqli_query($con, "INSERT INTO quotation_tb(prod_id,qty,price,branch_id,user_id,description) VALUES('0','$qty','$price','$branch','$user_id','$name')")or die(mysqli_error($con));
           
}
echo "<script>document.location='quotation'</script>";
?>