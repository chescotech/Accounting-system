<?php
error_reporting(0);

include('../dist/includes/dbcon.php');


$description = $_POST['description'];
$amount = $_POST['amount'];
$category = $_POST['category'];
$payee = $_POST['supplier'];
$payeeId = $_POST['supId'];
$pay = $_POST['pay'];
// $date =  date('Y-m-d H:i:s');
// $date =  $_POST['date'];
$pa = $_POST['paName'];
$paId = $_POST['pa'];
$expense = 'decrease';
$query = mysqli_query($con, "SELECT * FROM payment_account WHERE id = '$paId'") or die(mysqli_error($con));
$row = mysqli_fetch_assoc($query);
$pa = $row['name']; 
$balance = $row['balance'];


if (!empty($_FILES['file']['name'])) {
	$upload_id = round(microtime(true) * 1000);
	$file = $upload_id . "-" . $_FILES['file']['name'];
	$file_loc = $_FILES['file']['tmp_name'];
	$file_size = $_FILES['file']['size'];
	$file_type = $_FILES['file']['type'];
	$folder = "../Objects/";

	$Image_size = $_FILES['file']['size'];
	$Image_type = $_FILES['file']['type'];
	$Image_folder = "../Objects/";

	$new_size = $file_size / 1024000;
	$image_size = $file_size / 1024000;

	$new_file_name = strtolower($file);

	$Certificate = str_replace(' ', '-', $new_file_name);

	// Move the file if it was uploaded
	if (move_uploaded_file($file_loc, $folder . $Certificate)) {
		mysqli_query($con, "INSERT INTO expenses_tb(description,amount,category, payment_method,attachment,supplier_id,payment_acc_name, pay_acc_id,balance) 
				VALUES('$description','$amount','$category','$pay','$Certificate','$payee','$pa', '$paId', '$balance')")or die(mysqli_error($con));

mysqli_query($con, "UPDATE payment_account SET balance = balance - '$amount' WHERE id = '$paId'") or die(mysqli_error($con));
echo "<script type='text/javascript'>alert('Successfully added new Expense!');</script>";
echo "<script>document.location='expenses.php'</script>";
	}
} else {
	// No file was uploaded, but still process the form data
	mysqli_query($con, "INSERT INTO expenses_tb(description,amount,category, payment_method, supplier_id, payment_acc_name, pay_acc_id,balance) 
				VALUES('$description','$amount','$category','$pay','$payee','$pa','$paId', '$balance')")or die(mysqli_error($con));

mysqli_query($con, "UPDATE payment_account SET balance = balance - '$amount' WHERE id = '$paId'") or die(mysqli_error($con));

echo "<script type='text/javascript'>alert('Successfully added new Expense!');</script>";
echo "<script>document.location='expenses.php'</script>";
	
}

?>