<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include('../dist/includes/dbcon.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  
    $selected_bank_id = $_POST["selected_bank"];
    $selected_account_name = $_POST["selected_account"];
    $business_account_name = $_POST["payment_account"];


    if (!empty($selected_bank_id)) {
      
        $checkQuery = "SELECT * FROM primary_bank WHERE bank_id = $selected_bank_id";
        $result = mysqli_query($con, $checkQuery);

        if (mysqli_num_rows($result) > 0) {
   
            $updateQuery = "UPDATE primary_bank SET business_account_name = '$business_account_name', account_name = '$selected_account_name' WHERE bank_id = $selected_bank_id";
            mysqli_query($con, $updateQuery);
        } else {
          
            $insertQuery = "INSERT INTO primary_bank (bank_id, business_account_name, account_name) VALUES ($selected_bank_id, '$business_account_name', '$selected_account_name')";
            mysqli_query($con, $insertQuery);
        }
    }

    echo "<script>alert('Record inserted successfully.');
                  window.location.href = '{$_SERVER['HTTP_REFERER']}';
                  </script>";
} else {
    
    echo "<script>alert('Error Encountered.');
                  window.location.href = '{$_SERVER['HTTP_REFERER']}';
                  </script>";
}
?>
