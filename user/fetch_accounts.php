<?php
include('../dist/includes/dbcon.php');

// Retrieve the selected bank's ID from the AJAX request
$selectedBankId = $_POST['bank_id'];

// Query the database for account names based on the selected bank's ID
$query = mysqli_query($con, "SELECT account_name FROM bank WHERE id = '$selectedBankId' ORDER by account_name") or die(mysqli_error($con));

// Build the HTML options for the "Bank Account Name" dropdown
$options = "<option value=''>--Select Bank Account--</option>";
while ($row = mysqli_fetch_assoc($query)) {
    $expName = $row['account_name'];
    $options .= "<option value='$expName'>$expName</option>";
}

echo $options;

// Close the database connection
mysqli_close($con);
?>
