<?php
  $con = mysqli_connect("localhost","root","","moringa_db_");
  
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

  date_default_timezone_set("Africa/Lusaka"); 
?>

