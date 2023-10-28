<?php

session_start();
$id2 = $_SESSION['id'];
$branch = $_SESSION['branch'];

include('../dist/includes/dbcon.php');

// Check if barcode has been used or not.
$user_id = $_SESSION['id'];
$qty = $_POST['qty'];
$name = $_POST['description'];
$price = $_POST['price'];
$id = $_POST['id'];
$order_no = $_POST['order_no'];
$customer_name = $_POST['customer_name'];
$custname = $_POST['name'];

// Check if the sales_id exists in the "sales" table.
$result = mysqli_query($con, "SELECT * FROM sales WHERE sales_id = '$id'");
if (mysqli_num_rows($result) > 0) {
    // The sales_id exists, so update the row.
    mysqli_query($con, "UPDATE sales SET total = total + '$price', customer_id = '$customer_name' WHERE sales_id = '$id'") or die(mysqli_error($con));
} else {
    // The sales_id does not exist, so you can insert a new row if needed.
    mysqli_query($con, "INSERT INTO sales (sales_id, total, customer_id) VALUES ('$id', '$price', '$customer_name')") or die(mysqli_error($con));
}

mysqli_query($con, "INSERT INTO sales_details (sales_id, qty, description, order_no, price) VALUES ('$id', '1', '$name', '$order_no', '$price')") or die(mysqli_error($con));


echo "<script>document.location='update-receipt.php?orderno=$order_no&customer_name=$custname&cust_id=$customer_name'</script>";
?>
