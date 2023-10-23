<?php
include("../dist/includes/dbcon.php");

$id = $_POST['id'];
$cid = $_POST['cid'];
$price = $_POST['price'];
$order_no = $_POST['order_no'];
$salesid = $_POST['salesid'];
$cust_first = $_POST['custname'];

// Delete from sales_details
$result = mysqli_query($con, "DELETE FROM sales_details WHERE sales_details_id = '$id'")
    or die(mysqli_error($con));

// Reduce the "total" column in the "sales" table by the price
$update_sales_query = "UPDATE sales SET total = total - $price WHERE sales_id = '$salesid'";
mysqli_query($con, $update_sales_query) or die(mysqli_error($con));

// Check if there are no more sales_details with this sales_id, then delete the sales row
$check_sales_details_query = "SELECT * FROM sales_details WHERE sales_id = '$salesid'";
$result = mysqli_query($con, $check_sales_details_query);
if (mysqli_num_rows($result) == 0) {
    // No more sales_details, so delete the corresponding sales row
    $delete_sales_query = "DELETE FROM sales WHERE sales_id = '$salesid'";
    mysqli_query($con, $delete_sales_query) or die(mysqli_error($con));
}

echo "<script>document.location='update-receipt.php?orderno=$order_no&customer_name=$cust_first&cust_id=$id'</script>";
?>
