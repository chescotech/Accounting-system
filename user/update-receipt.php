<?php
error_reporting(E_ALL);

session_start();
if (empty($_SESSION['id'])) :
    header('Location:../index.php');
endif;
if (empty($_SESSION['branch'])) :
    header('Location:../index.php');
endif;
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
    <script language="JavaScript">
        <!--
        javascript: window.history.forward(1);
        //
        -->
    </script>
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
                        <a class="btn btn-lg btn-warning" href="javascript:void(0);" onclick="window.history.back();">Back</a>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Receipts</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Sales Receipt Transaction</h3>
                                </div>
                                <div class="box-body">
                                    <p style="color: orange; font-weight:bold;">*Note all changes are auto saved*</p>
                                    <form method="post" action="transaction-modifyadd-draft.php">

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
                                    $orderno = $_GET['orderno'];
                                    $querz = mysqli_query($con, "SELECT * FROM sales WHERE invoice_no='$orderno' ") or die(mysqli_error($con));
                                    $rowz = mysqli_fetch_array($querz);
                                    $idz = $rowz['sales_id'];
                                    $cust_id = $_GET['cust_id'];
                                    $cust_first = $_GET['customer_name'];
                                    ?>

                                    <div id="add_service" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog">
                                            <div class="modal-content" style="height:auto">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">×</span></button>
                                                    <h4 class="modal-title">Add Item To Bill.</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="form-horizontal" method="post" action="receipt_mod_draft" enctype='multipart/form-data'>
                                                        <div class="col-md-12">
                                                        </div>
                                                        <label>Description:</label>
                                                        <input type="text" class="form-control" id="price" name="description" required autocomplete="off">

                                                        <label>Price:</label>
                                                        <input type="text" class="form-control" id="price" name="price" required autocomplete="off">
                                                        <div hidden="">
                                                            <input hidden="" type="text" class="form-control" id="price" name="order_no" value="<?php echo $_GET['orderno']; ?>">
                                                        </div>
                                                        <input type="hidden" class="form-control" id="price" name="id" value="<?php echo $idz; ?>">
                                                        <input type="hidden" class="form-control" id="price" name="name" value="<?php echo $cust_first; ?>">
                                                        <input type="hidden" class="form-control" id="price" name="qty" value="1">

                                                        <div hidden="">
                                                            <input hidden="" type="text" class="form-control" id="price" name="customer_name" value="<?php echo $cust_id; ?>">
                                                        </div>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">Add</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>





                                <div class="col-md-12">
                                    <?php
                                    $queryb = mysqli_query($con, "select balance from customer where cust_id='$cust_id'") or die(mysqli_error($con));
                                    $rowb = mysqli_fetch_array($queryb);
                                    $balance = $rowb['balance'];

                                    if ($balance > 0) $disabled = "disabled=true";
                                    else {
                                        $disabled = "";
                                    }
                                    ?>
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th> Description</th>
                                                <th>Unit Price</th>
                                                <th>Total</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $orderno = $_GET['orderno'];

                                            $query = mysqli_query($con, "SELECT sales.invoice_no, customer.cust_first, sales_details.*
                                            FROM sales_details
                                            LEFT JOIN sales ON sales_details.sales_id = sales.sales_id
                                            JOIN customer ON sales.customer_id = customer.cust_id
                                            WHERE sales.invoice_no = '$orderno'") or die(mysqli_error($con));
                                            $grand = 0;
                                            while ($row = mysqli_fetch_array($query)) {
                                                $id = $row['sales_id'];
                                                $total = $row['price'] * $row['qty'];
                                                $unitPrice = $row['price'] / $row['qty'];
                                                $grand = $grand + $total;
                                                $customer_name = $row['cust_first'];

                                            ?>
                                                <tr>
                                                    <td class="record"><?php
                                                                        if ($row['description'] == '') {
                                                                            echo $row['description'];
                                                                        } else {
                                                                            echo $row['description'];
                                                                        } ?></td>
                                                    <td><?php echo number_format($row['price'], 2); ?></td>
                                                    <td><?php echo number_format($total, 2); ?></td>
                                                    <td>
                                                        <a href="#updateordinance<?php echo $row['sales_details_id']; ?>" data-target="#updateordinance<?php echo $row['sales_details_id']; ?>" data-toggle="modal" style="color:#fff;" class="small-box-footer"><i class="glyphicon glyphicon-edit text-blue"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#delete<?php echo $row['sales_details_id']; ?>" data-target="#delete<?php echo $row['sales_details_id']; ?>" data-toggle="modal" style="color:#fff;" class="small-box-footer"><i class="glyphicon glyphicon-trash text-red"></i></a>
                                                    </td>
                                                </tr>
                                                <div id="updateordinance<?php echo $row['sales_details_id']; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="height:auto">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title">Update Sales Details</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form class="form-horizontal" method="post" action="update_receipt_trans.php" enctype='multipart/form-data'>
                                                                    <input type="hidden" class="form-control" name="cid" value="<?php echo $cid; ?>" required>
                                                                    <input type="hidden" class="form-control" id="price" name="id" value="<?php echo $row['sales_details_id']; ?>" required>
                                                                    <input type="hidden" class="form-control" id="price" name="sid" value="<?php echo $row['sales_id']; ?>" required>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-lg-3" for="price">Description</label>
                                                                        <div class="col-lg-9">
                                                                            <input type="text" class="form-control" id="price" name="description" value="<?php echo $row['description']; ?>" required>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label class="control-label col-lg-3" for="price">Price</label>
                                                                        <div class="col-lg-9">
                                                                            <input type="text" class="form-control" id="price" name="price" value="<?php echo $row['price']; ?>" required>
                                                                        </div>
                                                                    </div>

                                                            </div><br>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Save
                                                                    changes</button>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            </div>
                                                            </form>
                                                        </div>

                                                    </div>

                                                </div>

                                                <div id="delete<?php echo $row['sales_details_id']; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="height:auto">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title">Delete Item</h4>
                                                            </div>
                                                            <?php $queryx = mysqli_query($con, "SELECT * FROM sales_details WHERE sales_details_id=' {$row['sales_details_id']}'") or die(mysqli_error($con));

                                                            $rowx = mysqli_fetch_array($queryx);
                                                            $price = $rowx['price'];

                                                            ?>
                                                            <div class="modal-body">
                                                                <form class="form-horizontal" method="post" action="delete_receipt_tran.php" enctype='multipart/form-data'>
                                                                    <input type="hidden" class="form-control" name="custname" value="<?php $_GET['customer_name']; ?>" required>
                                                                    <input type="hidden" class="form-control" id="price" name="id" value="<?php echo $row['sales_details_id']; ?>" required>
                                                                    <input type="hidden" class="form-control" id="price" name="order_no" value="<?php echo $_GET['orderno']; ?>" required>
                                                                    <input type="hidden" class="form-control" id="price" name="salesid" value="<?php echo $row['sales_id']; ?>" required>
                                                                    <input type="hidden" class="form-control" id="price" name="price" value="<?php echo $price; ?>" required>
                                                                    <p>Are you sure you want to remove
                                                                        <?php echo $row['description']; ?>?</p>
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

                        <form method="post" name="autoSumForm" action="draft-sales-add.php">
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="form-group">
                                        <label for="date">Total</label>

                                        <input type="text" style="text-align:right" class="form-control" id="total" name="total" placeholder="Total" value="<?php echo $grand; ?>" onFocus="startCalc();" onBlur="stopCalc();" tabindex="5" readonly>

                                    </div>
                                    <div class="form-group" hidden="ds">
                                        <label for="date">Discount</label>

                                        <input type="text" class="form-control text-right" id="discount" name="discount" value="0" tabindex="6" placeholder="Discount (Php)" onFocus="startCalc();" onBlur="stopCalc();">
                                        <input type="hidden" class="form-control text-right" id="cid" name="cid" value="<?php echo $cid; ?>">
                                    </div>
                                    <div class="form-group">
                                        <label for="date">Amount Due</label>

                                        <input type="text" style="text-align:right" class="form-control" id="amount_due" name="amount_due" placeholder="Amount Due" value="<?php echo number_format($grand, 2); ?>" readonly>

                                    </div>


                                    <div class="form-group" id="tendered" hidden="">
                                        <label for="date">Customers Name</label><br>
                                        <input type="text" style="text-align:right" class="form-control" onFocus="startCalc();" onBlur="stopCalc();" id="cash" name="customer_name" placeholder="Customers Name" value="<?php echo $customer_name; ?>" required="">
                                    </div>

                                </div>

                            </div>


                    </div>


                </div>


                </section>
            </div>
        </div>
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
    <!-- FastClick -->
    <script src="../plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
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
                "placeholder": "mm/dd/yyyy"
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
            //Date range as a button
            $('#daterange-btn').daterangepicker({
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1,
                            'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function(start, end) {
                    $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format(
                        'MMMM D, YYYY'));
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