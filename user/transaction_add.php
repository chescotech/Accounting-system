<?php
session_start();
$id = $_SESSION['id'];
$branch = $_SESSION['branch'];

include('../dist/includes/dbcon.php');
include('Classes/DAO.php');
$DAO = new DAO();
$cid = $_POST['cid'];
$barcode = $_POST['barcode'];
$selected_cust_id = $_SESSION['selected_cust_id'];

if ($barcode != "") {
    $qty = "1";

    $checkBarcodeDetails = mysqli_query($con, "select prod_id,prod_qty,prod_name from product WHERE barcode='$barcode'")or die(mysqli_error($con));
    $countRows = mysqli_num_rows($checkBarcodeDetails);
    if ($countRows > 0) {
        $user_id = $_SESSION['id'];
        $getBarcodeDetails = mysqli_query($con, "select prod_id,prod_qty,prod_name from product WHERE barcode='$barcode'")or die(mysqli_error($con));
        $barcodeRows = mysqli_fetch_array($getBarcodeDetails);
        $name = $barcodeRows['prod_name'];
        $prod_id = $barcodeRows['prod_id'];
        $noQtyInStock = $barcodeRows['prod_qty'];
        $prodName = $barcodeRows['prod_name'];

        if ($qty <= $noQtyInStock) {
            $query = mysqli_query($con, "select * from product where prod_id='$prod_id'")or die(mysqli_error($con));
            $row = mysqli_fetch_array($query);

            $typeCustomer = $DAO->getCustomerType($con, $selected_cust_id);
            if($typeCustomer=="wholesale_price"){
                $price = $row['wholesale_price'];
            }else if ($typeCustomer=="discount_price"){
                $price = $row['discount_price'];
            }else if ($typeCustomer=="special_price"){
                $price = $row['special_price'];
            }else{
                $price = $row['prod_sell_price'];
            }

            $query1 = mysqli_query($con, "select * from temp_trans where prod_id='$prod_id' and branch_id='$branch'")or die(mysqli_error($con));
            $count = mysqli_num_rows($query1);

            $total = $price * $qty;

            if ($count > 0) {
                mysqli_query($con, "update temp_trans set qty=qty+'$qty' where prod_id='$prod_id' and branch_id='$branch'")or die(mysqli_error($con));
            } else {
                mysqli_query($con, "INSERT INTO temp_trans(prod_id,qty,price,branch_id,user_id) VALUES('$prod_id','$qty','$price','$branch','$user_id')")or die(mysqli_error($con));
            }
            echo "<script>document.location='cash_transaction.php?cid=$cid'</script>";
        } else {
            echo "<script type='text/javascript'>alert('Error !!, you cannot sell " . $qty . " items of " . $noQtyInStock . " because it is more than what is in stock !!! ');</script>";
            echo "<script>document.location='cash_transaction.php?cid=$cid'</script>";
        }
    } else {
        echo "<script type='text/javascript'>alert('Error !!, barcode " . $barcode . " is not found in the System,please search for product !!');</script>";
        echo "<script>document.location='cash_transaction.php?cid=$cid'</script>";
    }
} else {
    $user_id = $_SESSION['id'];
    $qty = $_POST['qty'];
    $name = $_POST['prod_name'];
    $qtyChecker = mysqli_query($con, "select prod_qty,prod_name from product WHERE prod_id='$name'")or die(mysqli_error($con));
    $qtyRows = mysqli_fetch_array($qtyChecker);
    $noQtyInStock = $qtyRows['prod_qty'];
    $prodName = $qtyRows['prod_name'];

    if ($qty <= $noQtyInStock) {
        $query = mysqli_query($con, "select * from product where prod_id='$name'")or die(mysqli_error($con));
        $row = mysqli_fetch_array($query);

        $typeCustomer = $DAO->getCustomerType($con, $selected_cust_id);
        if($typeCustomer=="wholesale_price"){
            $price = $row['wholesale_price'];
        }else if ($typeCustomer=="discount_price"){
            $price = $row['discount_price'];
        }else if ($typeCustomer=="special_price"){
            $price = $row['special_price'];
        }else{
            $price = $row['prod_sell_price'];
        }

        $query1 = mysqli_query($con, "select * from temp_trans where prod_id='$name' and branch_id='$branch'")or die(mysqli_error($con));
        $count = mysqli_num_rows($query1);

        $total = $price * $qty;

        if ($count > 0) {
            mysqli_query($con, "update temp_trans set qty=qty+'$qty' where prod_id='$name' and branch_id='$branch'")or die(mysqli_error($con));
        } else {
            mysqli_query($con, "INSERT INTO temp_trans(prod_id,qty,price,branch_id,user_id) VALUES('$name','$qty','$price','$branch','$user_id')")or die(mysqli_error($con));
        }
        echo "<script>document.location='cash_transaction.php?cid=$cid'</script>";
    } else {
        echo "<script type='text/javascript'>alert('Error !!, you cannot sell " . $qty . " items of " . $prodName . " because it is more than what is in stock !!! ');</script>";
        echo "<script>document.location='cash_transaction.php?cid=$cid'</script>";
    }
}
?>