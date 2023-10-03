<?php

session_start();
if (empty($_SESSION['id'])):
    header('Location:../index.php');
endif;

include('../dist/includes/dbcon.php');
$branch_name = $_POST['branch_name'];
$address = $_POST['address'];
$contact = $_POST['contact'];
$reciept_footer_text = $_POST['reciept_footer_text'];
$notification_count = $_POST['notification_count'];


$bank_account_name = $_POST['bank_account_name'];
$bank = $_POST['bank'];
$account_number = $_POST['account_number'];
$sort_code = $_POST['sort_code'];
$branch_code = $_POST['branch_code'];

$target_dir = "../dist/uploads/comp/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

$logo = basename($_FILES["fileToUpload"]["name"]);

// Check file size
if ($_FILES["fileToUpload"]["size"] > 500000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}

// Allow certain file formats
if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file

    mysqli_query($con, "UPDATE branch set branch_name='$branch_name',branch_address='$address',
        branch_contact='$contact', reciept_footer_text='$reciept_footer_text' ,notification_count='$notification_count' ,bank_account_name='$bank_account_name', "
                    . "bank='$bank', account_number='$account_number' ,sort_code='$sort_code',branch_code='$branch_code' ")or die(mysqli_error($con));
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        // echo "The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";

        mysqli_query($con, "UPDATE branch set branch_name='$branch_name',branch_address='$address',logo='$logo',
        branch_contact='$contact', reciept_footer_text='$reciept_footer_text' ,notification_count='$notification_count' ,bank_account_name='$bank_account_name', "
                        . "bank='$bank', account_number='$account_number' ,sort_code='$sort_code',branch_code='$branch_code' ")or die(mysqli_error($con));
    } else {

        mysqli_query($con, "UPDATE branch set branch_name='$branch_name',branch_address='$address',
        branch_contact='$contact', reciept_footer_text='$reciept_footer_text' ,notification_count='$notification_count' ,bank_account_name='$bank_account_name', "
                        . "bank='$bank', account_number='$account_number' ,sort_code='$sort_code',branch_code='$branch_code' ")or die(mysqli_error($con));
    }
}


echo "<script type='text/javascript'>alert('Successfully Updated Company details!');</script>";
echo "<script>document.location='company-setup.php'</script>";
?>
