<?php

session_start();
include('../dist/includes/dbcon.php');
$branch = $_SESSION['branch'];
$last = $_POST['last'];
$first = $_POST['first'];
$address = $_POST['address'];
$contact = $_POST['contact'];
$type = $_POST['type'];
$price_tag = $_POST['price_tag'];

$query2 = mysqli_query($con, "select * from customer where cust_first='$first' and branch_id='$branch'") or die(mysqli_error($con));
$count = mysqli_num_rows($query2);

if ($count > 0) {
    echo "<script type='text/javascript'>alert('Customer already exist!');</script>";
    echo "<script>document.location='cust_new.php'</script>";
} else {

    mysqli_query($con, "INSERT INTO customer(cust_last,cust_first,cust_address,cust_contact,branch_id,balance,cust_pic,price_tag) 
				VALUES('$last','$first','$address','$contact','$branch','0','default.gif','$price_tag')") or die(mysqli_error($con));

    $id = mysqli_insert_id($con);
    //$_SESSION['cid']=$id;
    echo "<script type='text/javascript'>alert('Successfully added new customer!');</script>";

    if ($type == "cash") {
        echo "<script>document.location='select_customer_credit.php'</script>";
    } else if ($type == "quote") {
        echo "<script>document.location='quotation'</script>";
    }
}
