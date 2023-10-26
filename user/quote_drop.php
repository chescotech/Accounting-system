<?php

include("../dist/includes/dbcon.php");
$id = $_GET['quote_id'];
$result = mysqli_query($con, "DELETE FROM quotation_tb WHERE quote_identity ='$id'")
        or die(mysqli_error($con));

echo "<script>document.location='quotations.php'</script>";

?>