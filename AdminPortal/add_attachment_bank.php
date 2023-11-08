<?php
error_reporting(0);

include('../dist/includes/dbcon.php');

$id = $_GET['id'];
$description = $_POST['description'];
$amount = $_POST['amount'];
$transid = $_POST['transid'];
$payee = $_POST['supplier'];
$trans_type = $_POST['category'];
$pay = $_POST['pm'];
$paId = $_POST['payment_account'];
$date = $_POST['date'];
$fc = $_POST['file'];
$namec = $_POST['name'];

$query = mysqli_query($con, "SELECT * FROM payment_account WHERE id = '$paId'") or die(mysqli_error($con));
$row = mysqli_fetch_assoc($query);
$pa = $row['name'];
$balance = $row['balance'];

$queryb = mysqli_query($con, "SELECT * FROM bank WHERE id = '$id'") or die(mysqli_error($con));
$rowb = mysqli_fetch_assoc($queryb);
$bank_name = $rowb['bank_name'];
$acc_name = $rowb['account_name'];

if ($trans_type == "Invoice") {
	// Insert into 'credit' column if it's an Invoice
	mysqli_query($con, "INSERT INTO contra_transactions(description, debit, transaction_type, transaction_id, bank_name, bank_id, account_name, date, status)
        VALUES('$description', '$amount', '$trans_type', '$transid', '$bank_name', '$id', '$acc_name', '$date', 'Confirmed')") or die(mysqli_error($con));

	// Increase the 'total' in the 'bank' table
	mysqli_query($con, "UPDATE bank SET total = total + '$amount' WHERE id = '$id'") or die(mysqli_error($con));
} elseif ($trans_type == "Payment") {
	// Insert into 'debit' column if it's a Payment
	mysqli_query($con, "INSERT INTO contra_transactions(description, credit, transaction_type, transaction_id, bank_name, bank_id, account_name, date, status)
        VALUES('$description', '$amount', '$trans_type', '$transid', '$bank_name', '$id', '$acc_name', '$date', 'Confirmed')") or die(mysqli_error($con));

	// Update the 'credit' and 'total' in the 'bank' table
	mysqli_query($con, "UPDATE bank SET credit = credit + '$amount', total = total - '$amount' WHERE id = '$id'") or die(mysqli_error($con));
}

// File Upload Handling
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
		mysqli_query($con, "UPDATE contra_transactions SET attachment = '$Certificate' WHERE transaction_id = '$transid'") or die(mysqli_error($con));
	}

	
}

// Update the balance in the 'payment_account' table
mysqli_query($con, "UPDATE payment_account SET balance = balance + '$amount' WHERE id = '$paId'") or die(mysqli_error($con));

echo "<script type='text/javascript'>alert('Successfully added');</script>";
// echo "<script>document.location='bank_account_history.php?id=$id'</script>";

echo "microtime(true) value: " . microtime(true) . "<br>";
echo "upload_id: " . $upload_id . "<br>";

echo "Original file name: $file<br>";
	echo "Sanitized file name: $Certificate<br>";
