<?php
session_start();
error_reporting(E_ALL);
include('../dist/includes/dbcon.php');

if (isset($_POST['addtocart'])) {
    $prod_name = $_POST['prod_name'];
    $cus_name = $_POST['cus_name'];
    $cid2 = $_POST['prod_name'];
    $cust_id = $_POST['cust_id'];
  
    // Initialize an array to store the values to be inserted
    $insertValues = [];

    // Check if the row is already present in credit_temp
    $checkSql = "SELECT COUNT(*) as count FROM credit_temp WHERE invoice_no = '$cid2'";
    $checkResult = mysqli_query($con, $checkSql);
    $row = mysqli_fetch_assoc($checkResult);

    if ($row['count'] == 0) {
        // Iterate through all rows in the draft_temp_trans table with the same order_no
        $sql = "SELECT * FROM draft_temp_trans WHERE order_no='$cid2'";
        $result = mysqli_query($con, $sql);

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $description = $row['description'];
                $price = $row['price'];
                $qty = $row['qty'];
                $prod_id = $row['prod_id'];
                $total = $qty * $price;

                // Add values to the insert array
                $insertValues[] = "('$cus_name', '$total', CAST('$cid2' AS UNSIGNED), '$row[temp_trans_id]', '$cust_id', '$qty', '$price','$description','$prod_id')";
            }

            // Build the query to insert all rows at once
            $insertQuery = "INSERT INTO credit_temp (name, amount, invoice_no, invoice_id, cust_id, qty, price,description, prod_id) 
                            VALUES " . implode(",", $insertValues);

            if (mysqli_query($con, $insertQuery)) {
                
                echo "Data inserted successfully for order_no $cid2";


            } else {
                echo "Error: " . mysqli_error($con);
            }
        }
    } else {
        echo "Data already exists for order_no $cid2 in credit_temp.";
    }

    mysqli_close($con);

    Header("Location: credit_note?order_no=" . urlencode($cust_id) . "&addtocart=");
    exit();
}
?>
