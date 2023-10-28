<?php session_start();
if (empty($_SESSION['id'])) :
  header('Location:../index.php');
endif;
if (empty($_SESSION['branch'])) :
  header('Location:../index.php');
endif;

if (isset($_POST['selected_cust_id'])) {
  $_SESSION['selected_cust_id'] = $_POST['selected_cust_id'];
}


include('Classes/DAO.php');

$DAO = new DAO();

?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Home | <?php include('../dist/includes/title.php'); ?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="../plugins/select2/select2.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  <script src="../dist/js/jquery.min.js"></script>

</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav" onload="myFunction()">
  <div class="wrapper">
    <?php include('../dist/includes/header.php'); ?>
    <!-- Full Width Column -->
    <div class="content-wrapper">
      <div class="container">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            <a class="btn btn-lg btn-warning" href="sold-items.php">Back</a>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Product</li>
          </ol>
        </section>
        <section class="content">
          <div class="row">
            <div class="col-md-8">
              <div class="box box-primary">
                <div class="box-header">
                  <h3 class="box-title">Recieve Payment.</h3>
                  <?php
                  $userId = $_SESSION['id'];
                  $today = date("Y-m-d H:i:s");
                  $totalAmountCollected = 0;

                  $query2 = mysqli_query($con, "SELECT SUM(qty) AS qty, prod_sell_price  "
                    . "FROM sales_details INNER JOIN sales ON sales.sales_id=sales_details.sales_id INNER JOIN user ON user.user_id = sales.user_id "
                    . "INNER JOIN product ON product.prod_id = sales_details.prod_id"
                    . " AND sales.date_added <= '$today' AND user.user_id='$userId' GROUP BY stock_branch_id") or die(mysqli_error($con));

                  while ($row = mysqli_fetch_array($query2)) {
                    $totalSold = $row['qty'] * $row['prod_sell_price'];
                    $totalAmountCollected += $totalSold;
                  }

                  $cahsoutLimitQuery = mysqli_query($con, " SELECT * FROM cashout_limits_tb WHERE status ='Active' ") or die(mysqli_error($con));
                  $row2 = mysqli_fetch_array($cahsoutLimitQuery);
                  // $limit = $row2['cashoutlimit'];
                  $found = mysqli_num_rows($cahsoutLimitQuery);
                  ?>
                  <br>
                  <?php

                  if ($found != "0") {
                    if ($totalAmountCollected > $limit) {
                      echo ' <h2 class="box-title" style=" color: red"><b>You have exceeded your Selling Limit of : ' . number_format($limit, 2) . ' please cashout !!
                  </b></h2>';
                    }
                  }
                  ?>
                </div>
                <div class="box-body">
                  <?php
                  if (isset($_POST['addtocart'])) {
                    //$barcode = $_POST['barcode'];
                    //$query = mysql_query(" INSERT INTO barcode VALUES ('','$barcode',now())");
                    //echo $barcode . '<br>';
                    //header("LOCATION:test-barcode.php");6001068379101
                  }
                  ?>
                  <form method="post" action="transaction_add.php">
                    <div class="row">

                      <div class="col-md-2">
                        <div class="form-group">
                          <label for="date"></label>
                          <div class="input-group">
                            <a href="#add_service" class="btn btn-success" data-target="#add_service" data-toggle="modal" style="color:#000;" class="small-box-footer"> <b>Add Item </b> <i class="glyphicon glyphicon-plus-sign text-red"></i></a>
                          </div>
                        </div>
                  </form>


                  <?php

                  $cust_id =  $_SESSION['selected_cust_id'];
                  $query22 = mysqli_query($con, "SELECT * FROM customer  WHERE cust_id = '$cust_id'  ") or die(mysqli_error($con));
                  $row22 = mysqli_fetch_array($query22);

                  $cust_name = $row22['cust_first'];


                  ?>

                  <!-- <a href="#add_service" data-target="#add_service" data-toggle="modal" style="color:#3c8dbc;" class="small-box-footer"> <b>Add Item </b> <i class="glyphicon glyphicon-plus-sign text-red"></i></a> -->
                  <div id="add_service" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                      <div class="modal-content" style="height:auto">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span></button>
                          <h4 class="modal-title">Add Item To Bill.</h4>
                        </div>
                        <div class="modal-body">
                          <form class="form-horizontal" method="post" action="add-item-to-bill.php" enctype='multipart/form-data'>
                            <div class="col-md-12">
                            </div>

                            <label>Description:</label>
                            <input type="text" class="form-control" id="price" name="description" required autocomplete="off">

                            <label>Price:</label>
                            <input type="text" class="form-control" id="price" name="price" required autocomplete="off">

                            <!-- <label>Quantity:</label> -->
                            <input type="hidden" value="1" class="form-control" id="price" name="qty" required autocomplete="off">

                        </div>
                        <div class="modal-footer">
                          <button type="submit" class="btn btn-primary">Add</button>
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                        </form>
                      </div>
                    </div>
                    <!--end of modal-dialog-->

                  </div>

                </div>
                <div class="col-md-12">
                  <?php


                  $queryb = mysqli_query($con, "select balance from customer where cust_id='$cust_id'") or die(mysqli_error($con));
                  $rowb = mysqli_fetch_array($queryb);

                  ?>
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>Customer Name</th>

                        <th>Description</th>
                        <th>Unit Price</th>
                        <th>Total</th>
                        <th>Action</th>
                        <th>Discount</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $user_id = $_SESSION['id'];
                      $selected_cust_id = $_SESSION['selected_cust_id'];
                      $query = mysqli_query($con, "SELECT * from temp_trans LEFT JOIN product ON product.prod_id=temp_trans.prod_id where temp_trans.branch_id='$branch' AND temp_trans.user_id='$user_id'  ") or die(mysqli_error($con));
                      $grand = 0;
                      $totalDiscount = 0;
                      $newPrice = 0;
                      while ($row = mysqli_fetch_array($query)) {
                        $id = $row['temp_trans_id'];
                        $amount = $row['amount'];
                        $discount_type = $row['discount_type'];
                        if ($amount != "") {
                          if ($discount_type == "Percentage") {
                            $newPrice = ($amount / 100) * ($row['price'] * $row['qty']);
                            //$newPrice = $price - $computedPrice;
                          } else {
                            $newPrice = $amount;
                          }
                          $total = ($row['price'] * $row['qty']) - $newPrice;
                        } else {
                          $total = ($row['price'] * $row['qty']);
                        }
                        $unitPrice = $row['price'] / $row['qty'];
                        $grand = $grand + $total;
                        $totalDiscount += $newPrice;
                      ?>
                        <tr>
                          <td><?php echo $cust_name; ?></td>
                          <!-- <td><?php echo $row['qty']; ?></td> -->
                          <td class="record"><?php
                                              if ($row['prod_name'] == '') {
                                                echo $row['description'];
                                              } else {
                                                echo $row['prod_name'];
                                              }
                                                // echo 'id'.$row['prod_id'];

                                              ; ?></td>
                          <td><?php
                              $priceTage = $row['price_tag'];
                              if ($priceTage == "") {
                                $priceTage = "Retail Price";
                              }
                              echo number_format($row['price'], 2) . ' ( ' . $DAO->getCustomerType($con, $selected_cust_id) . ' ) '; ?></td>
                          <td><?php echo number_format($total, 2); ?></td>
                          <td>

                            <a href="#updateordinance<?php echo $row['temp_trans_id']; ?>" data-target="#updateordinance<?php echo $row['temp_trans_id']; ?>" data-toggle="modal" style="color:#fff;" class="small-box-footer"><i class="glyphicon glyphicon-edit text-blue"></i></a>

                            <a href="#delete<?php echo $row['temp_trans_id']; ?>" data-target="#delete<?php echo $row['temp_trans_id']; ?>" data-toggle="modal" style="color:#fff;" class="small-box-footer"><i class="glyphicon glyphicon-trash text-red"></i></a>

                          </td>
                          <td>

                            <a href="#discount<?php echo $row['temp_trans_id']; ?>" data-target="#discount<?php echo $row['temp_trans_id']; ?>" data-toggle="modal" style="color:#fff;" class="small-box-footer"><i style="font-size:20px;" class="glyphicon glyphicon-record text-red"></i>

                              <?php
                              $discountType = $row['discount_type'];
                              $amount = $row['amount'];

                              if ($discountType != "Amount" && $amount != "") {
                                echo '<h6 style="color:#3c8dbc"><b> ' . $amount . ' % Discount</b></h6>';
                              } else if ($amount != "") {
                                echo '<h6 style="color:#3c8dbc"><b>Discount of K ' . $amount . '</b></h6>';
                              }
                              ?>
                            </a>
                          </td>
                        </tr>
                        <div id="updateordinance<?php echo $row['temp_trans_id']; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                          <div class="modal-dialog">
                            <div class="modal-content" style="height:auto">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">×</span></button>
                                <h4 class="modal-title">Update Sales Details</h4>
                              </div>
                              <div class="modal-body">
                                <form class="form-horizontal" method="post" action="transaction_update.php" enctype='multipart/form-data'>
                                  <input type="hidden" class="form-control" name="cid" value="<?php echo $cid; ?>" required>
                                  <input type="hidden" class="form-control" id="price" name="id" value="<?php echo $row['temp_trans_id']; ?>" required>
                                  <div class="form-group">
                                    <label class="control-label col-lg-3" for="price">Qty</label>
                                    <div class="col-lg-9">
                                      <input type="text" class="form-control" id="price" name="qty" value="<?php echo $row['qty']; ?>" required>
                                    </div>
                                  </div>
                                  <br>
                                  <div class="form-group">
                                    <label class="control-label col-lg-3" for="price">Update Price</label>
                                    <div class="col-lg-5">
                                      <input type="text" class="form-control" id="price" name="price" value="<?php echo $row['price']; ?>" required>

                                    </div>
                                  </div>
                                  <br>

                              </div><br>
                              <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Save changes</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              </div>
                              </form>
                            </div>

                          </div>
                          <!--end of modal-dialog-->
                        </div>
                        <!--end of modal-->
                        <div id="delete<?php echo $row['temp_trans_id']; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                          <div class="modal-dialog">
                            <div class="modal-content" style="height:auto">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">×</span></button>
                                <h4 class="modal-title">Delete Item</h4>
                              </div>
                              <div class="modal-body">
                                <form class="form-horizontal" method="post" action="transaction_del.php" enctype='multipart/form-data'>
                                  <input type="hidden" class="form-control" name="cid" value="<?php echo $cid; ?>" required>
                                  <input type="hidden" class="form-control" id="price" name="id" value="<?php echo $row['temp_trans_id']; ?>" required>
                                  <p>Are you sure you want to remove <?php echo $row['prod_name']; ?>?</p>

                              </div><br>
                              <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Delete</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              </div>
                              </form>
                            </div>

                          </div>
                          <!--end of modal-dialog-->
                        </div>

                        <div id="discount<?php echo $row['temp_trans_id']; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                          <div class="modal-dialog">
                            <div class="modal-content" style="height:auto">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">×</span></button>
                                <h4 class="modal-title">Apply Discount on
                                  <?php echo $row['prod_name']; ?>.</h4>
                              </div>
                              <div class="modal-body">
                                <form class="form-horizontal" method="post" action="add-discount.php" enctype='multipart/form-data'>
                                  <p style=" color: black">Enter Admin / Supervisor
                                    password to Authorize </p>
                                  <input type="password" class="form-control" id="price" name="password" required autocomplete="off">
                                  <input type="hidden" class="form-control" id="price" name="cid" value="<?php echo $row['temp_trans_id']; ?>" required autocomplete="off">
                                  <p style=" color: black">Enter Value.</p>
                                  <input class="form-control" id="price" name="amount" required autocomplete="off">
                                  <label for="date">Discount Type</label>
                                  <select class="form-control" name="discount_type" tabindex="1">
                                    <option value="Amount">Amount</option>
                                    <option value="Percentage">Percentage</option>
                                  </select>
                              </div><br>
                              <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Apply
                                  Discount</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              </div>
                              </form>
                            </div>

                          </div>
                          <!--end of modal-dialog-->
                        </div>
                        <!--end of modal-->
                      <?php } ?>
                    </tbody>

                  </table>
                </div><!-- /.box-body -->

              </div>



              </form>
            </div><!-- /.box-body -->
          </div><!-- /.box -->
      </div><!-- /.col (right) -->

      <div class="col-md-3">
        <div class="box box-primary">

          <div class="box-body">
            <!-- Date range -->
            <form method="post" name="autoSumForm" action="sales_add.php">
              <div class="row">
                <div class="col-md-12">

                  <div class="form-group">
                    <label for="date">Total</label>

                    <input type="text" style="text-align:right" class="form-control" id="total" name="total" placeholder="Total" value="<?php $vat = 0;

                                                                                                                                        echo $grand + $vat; ?>" onFocus="startCalc();" onBlur="stopCalc();" tabindex="5" readonly>

                  </div><!-- /.form group -->

                  <div class="form-group">
                    <label for="date">Discount</label>

                    <input type="text" style="text-align:right" class="form-control" id="amount_due" name="discount" placeholder="Amount Due" value="<?php echo $totalDiscount; ?>" readonly>

                  </div><!-- /.form group -->

                  <a href="#discount_all" data-target="#discount_all" data-toggle="modal" style="color:#fff;" class="small-box-footer">
                    <p style=" color: #3c8dbc"><b>Apply Discount on Total</b></p>
                  </a>
                  <div class="form-group">
                    <label for="date">Amount Due Incl Vat</label>

                    <input type="text" style="text-align:right" class="form-control" id="amount_due" name="amount_due" placeholder="Amount Due" value="<?php

                                                                                                                                                        $vat = 0;

                                                                                                                                                        echo $grand + $vat; ?>" readonly>

                  </div><!-- /.form group -->
                  <div class="form-group" id="tendered" hidden>
                    <label for="date">Select Customer</label><br>
                    <select class="form-control select2" name="cust_id" tabindex="1">
                      <option value="none">-- Select Customer --</option>
                      <?php

                      include('../dist/includes/dbcon.php');
                      $query2 = mysqli_query($con, "select * from customer ") or die(mysqli_error($con));
                      while ($row = mysqli_fetch_array($query2)) {
                      ?>
                        <option value="<?php echo $row['cust_id']; ?>"><?php echo " ( " . $row['cust_first'] . ' - ' . $row['cust_last'] . " ) "; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                  <a style=" color: blue" href="cust_new.php?type=cash" target="blank_"><b>Add New Customer</b></a><br></br>

                  <div class="form-group">
                    <label for="date">Mode Payment</label>

                    <select class="form-control select2" name="payment_mode_id" tabindex="1">
                      <?php

                      $query2 = mysqli_query($con, "select * from modes_of_payment_tb") or die(mysqli_error($con));
                      while ($row = mysqli_fetch_array($query2)) {
                      ?>
                        <option value="<?php echo $row['name']; ?>"><?php echo $row['name']; ?></option>
                      <?php } ?>
                    </select>                    
                  </div>

                  <div class="form-group" id="tendered">
                    <label for="date">Date</label><br>
                    <input type="date" style="text-align:right" class="form-control" id="cash" name="date" autocomplete="off" required="">
                  </div>

                  <div class="form-group" id="tendered">
                    <label for="date">Select Currency</label><br>
                    <select class="form-control select2" name="currency" tabindex="1" >
                      <option value="none">-- Select Currency --</option>
                      <?php
                      $query2 = mysqli_query($con, "select * from exchange_rates_tb ") or die(mysqli_error($con));
                      while ($row = mysqli_fetch_array($query2)) {
                      ?>
                        <option value="<?php echo $row['name']; ?>"><?php echo " ( " . $row['name'] . " ) "; ?></option>
                      <?php } ?>
                    </select>
                  </div>

                  <div class="form-group">
                    <label for="date">Invoicing Option</label>

                    <select class="form-control select2" name="invoice_mode" tabindex="1">

                      <option value="download">Download / Print Invoice</option>
                      <option value="note">Delivery Note</option>
                      <option value="email">Email Receipt</option>
                      <option value="whatsapp">Send on Whats App</option>
                    </select>
                  </div>


                </div>



              </div>



              <button class="btn btn-lg btn-block btn-primary" id="daterange-btn" name="cash" type="submit" tabindex="7">
                Complete Sales
              </button>
              <button class="btn btn-lg btn-block" id="daterange-btn" type="reset" tabindex="8">
                <a href="cancel.php">Cancel Sale</a>
              </button>

            </form>
          </div><!-- /.box-body -->
        </div><!-- /.box -->
      </div><!-- /.col (right) -->

      <div id="discount_all" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
          <div class="modal-content" style="height:auto">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span></button>
              <h4 class="modal-title"> Apply Discount to
                <?php echo ' K ' . number_format($grand, 2); ?></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="post" action="add-discount-all.php" enctype='multipart/form-data'>
                <table>
                  <tr id="service">
                    <td> <span>Discount Type:</span>
                    </td>
                    <td>
                      <select class="form-control select4" name="discount_type" tabindex="1">
                        <option value="Percentage">
                          Percentage
                        </option>
                      </select>
                    </td>

                    <td> <span>Value :</span>
                    </td>

                    <td>
                      <input type="text" name="amount" class="amount" autocomplete="off" />
                    </td>
                  </tr>
                </table>
            </div><br>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">Apply</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
            </form>
          </div>
        </div>
      </div><!-- /.row -->
    </div><!-- /.row -->


    </section><!-- /.content -->
  </div><!-- /.container -->
  </div><!-- /.content-wrapper -->
  <?php include('../dist/includes/footer.php'); ?>
  </div><!-- ./wrapper -->
  <script>
    $(function() {

      $(".btn_delete").click(function() {
        var element = $(this);
        var id = element.attr("id");
        var dataString = 'id=' + id;
        if (confirm("Sure you want to delete this item?")) {
          $.ajax({
            type: "GET",
            url: "temp_trans_del.php",
            data: dataString,
            success: function() {

            }
          });

        }
        return false;
      });

    });
  </script>

  <script type="text/javascript" src="autosum.js"></script>
  <!-- jQuery 2.1.4 -->
  <script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
  <script src="../dist/js/jquery.min.js"></script>
  <!-- Bootstrap 3.3.5 -->
  <script src="../bootstrap/js/bootstrap.min.js"></script>
  <script src="../plugins/select2/select2.full.min.js"></script>
  <!-- SlimScroll -->
  <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
  <script src="../dist/js/app.min.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="../dist/js/demo.js"></script>
  <script src="../plugins/datatables/jquery.dataTables.min.js"></script>
  <script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>

  <script>
    $(function() {
      $("#example1").DataTable();
      $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false
      });
    });
  </script>
  <script>
    $(function() {
      //Initialize Select2 Elements
      $(".select2").select2();

      //Datemask dd/mm/yyyy
      $("#datemask").inputmask("dd/mm/yyyy", {
        "placeholder": "dd/mm/yyyy"
      });
      //Datemask2 mm/dd/yyyy
      $("#datemask2").inputmask("mm/dd/yyyy", {
        "placeholder`": "mm/dd/yyyy"
      });
      //Money Euro
      $("[data-mask]").inputmask();

      //Date range picker
      $('#reservation').daterangepicker();
      //Date range picker with time picker
      $('#reservationtime').daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        format: 'MM/DD/YYYY h:mm A'
      });

      $('#daterange-btn').daterangepicker({
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function(start, end) {
          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
      );

      //iCheck for checkbox and radio inputs
      $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue'
      });
      //Red color scheme for iCheck
      $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
        checkboxClass: 'icheckbox_minimal-red',
        radioClass: 'iradio_minimal-red'
      });
      //Flat red color scheme for iCheck
      $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green'
      });

      //Colorpicker
      $(".my-colorpicker1").colorpicker();
      //color picker with addon
      $(".my-colorpicker2").colorpicker();

      //Timepicker
      $(".timepicker").timepicker({
        showInputs: false
      });
    });
  </script>
</body>

</html>