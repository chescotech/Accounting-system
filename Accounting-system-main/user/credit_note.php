<?php
session_start();
if (empty($_SESSION['id'])) :
    header('Location:../index.php');
endif;
if (empty($_SESSION['branch'])) :
    header('Location:../index.php');
endif;

if (isset($_POST['selected_cust_id'])) {
    $_SESSION['selected_cust_id'] = $_POST['selected_cust_id'];

    $customer_id =  $_SESSION['selected_cust_id'];
}
include('Classes/DAO.php');

$DAO = new DAO();
//echo 'cust ' . $_SESSION['selected_cust_id'];
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

    <style>
        .com textarea {
            width: 23rem;
            height: 10rem;
        }
    </style>

</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav" onload="myFunction()">
    <script>
        function confirmDelete(invoiceId) {
            if (confirm("Are you sure you want to delete this entry?")) {
                // User confirmed, make an AJAX request to delete the entry
                $.ajax({
                    type: "POST",
                    url: "", // Replace with the URL to your PHP script for deleting entries
                    data: {
                        id: invoiceId // Corrected parameter name
                    },
                    success: function(response) {
                        // Handle the response from the server if needed
                        if (response === "success") {
                            // Entry deleted successfully, remove the row from the table
                            $("tr:contains('" + invoiceId + "')").remove();

                            location.reload();
                        } else {
                            location.reload();
                        }
                    }
                });
            }
        }
    </script>
    <div class="wrapper">
        <?php include('../dist/includes/header.php'); ?>
        <!-- Full Width Column -->
        <div class="content-wrapper">
            <div class="container">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        <a class="btn btn-lg btn-warning" href="javascript:void(0);" onclick="history.back();">Back</a>

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Credit</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="box box-primary">
                                <div class="box-body">                                   
                                    <form method="post" action="credit_temp_add.php">
                                        <div class="row" style="min-height:400px">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="date">Product Name</label>
                                                    <select class="form-control select2" name="prod_name" tabindex="1">
                                                        <?php
                                                        $branch = $_SESSION['branch'];
                                                        $cid = $_GET['order_no'];
                                                        $branch_id_user = $_SESSION['branch_id_user'];
                                                        include('../dist/includes/dbcon.php');
                                                        $query2 = mysqli_query($con, "select * from product where branch_id='$branch' AND stock_branch_id='$branch_id_user' AND prod_qty >0  order by prod_name") or die(mysqli_error($con));
                                                        while ($row = mysqli_fetch_array($query2)) {
                                                        ?>
                                                            <option value="<?php echo $row['prod_id']; ?>">
                                                                <?php echo $row['prod_name'] . " Available(" . $row['prod_qty'] . ")"; ?>
                                                            </option>
                                                        <?php } ?>
                                                    </select>
                                                    <input type="hidden" class="form-control" name="cid" value="<?php echo $_GET['order_no'] ?>" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <!-- <input type="hidden" class="form-control" name="prod_id" value="" required>
                                                <input type="hidden" class="form-control" name="prod_price" value="" required> -->
                                                <!-- <input type="hidden" class="form-control" name="cid" value="<?php echo $cid; ?>" required> -->
                                            </div>
                                            <div class=" col-md-2">
                                                <div class="form-group">
                                                    <label for="date">Quantity</label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control pull-right" id="date" name="qty" placeholder="Quantity" tabindex="2" value="1" required>
                                                    </div><!-- /.input group -->
                                                </div><!-- /.form group -->
                                            </div>

                                            <div class=" col-md-2">
                                                <div class="form-group">
                                                    <label for="date">Change Price</label>
                                                    <div class="input-group">
                                                        <input type="number" class="form-control pull-right" id="date" placeholder="change price" tabindex="2" value="" name="price">
                                                    </div><!-- /.input group -->
                                                </div><!-- /.form group -->
                                            </div>

                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="date"></label>
                                                    <div class="input-group">
                                                        <button class="btn btn-lg btn-primary" type="submit" tabindex="3" name="addtocart">+</button>
                                                    </div>
                                                </div>
                                    </form>

                                    


                                    <?php
                                    $cusid = $_GET["order_no"];
                                    $query2 = mysqli_query($con, "SELECT cust_first FROM customer WHERE cust_id='$cusid'") or die(mysqli_error($con));
                                    while ($row = mysqli_fetch_array($query2)) {
                                        $cname = $row['cust_first'];
                                    }
                                    ?>
                                    <a href="#add_service<?php echo $cusid; ?>" data-target="#add_service<?php echo $cusid; ?>" data-toggle="modal" style="color:#3c8dbc; display:flex; justify-content:start;" class="small-box-footer"> <b> Add Credit Note Item </b> <i class="glyphicon glyphicon-plus-sign text-red"></i></a>

                                    <div id="add_service<?php echo $cusid; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog">
                                            <div class="modal-content" style="height:auto">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">×</span></button>
                                                    <h4 class="modal-title">Add credit Note</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="form-horizontal" method="post" action="credit_temp_delete" enctype='multipart/form-data'>
                                                        <div class="col-md-12">
                                                        </div>

                                                        <input type="hidden" class="form-control" id="price" value="<?php echo $cname ?>" name="name" required autocomplete="off">

                                                        <label>Description:</label>
                                                        <input type="text" class="form-control" id="price" name="description" required autocomplete="off">

                                                        <label>qty:</label>
                                                        <input type="text" class="form-control" id="price" name="qty" required autocomplete="off">

                                                        <label>price:</label>
                                                        <input type="text" class="form-control" id="price" name="price" required autocomplete="off">

                                                        <input type="hidden" class="form-control" name="cust_id" value="<?php echo $cusid; ?>">

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary" name="manual">Add</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!--end of modal-dialog-->

                                    </div>
                                </div>
                                <br>
                                <div class="col-md-12">

                                    <?php
                                    //echo 'branch' . $branch_id_user;
                                    $queryb = mysqli_query($con, "select balance from customer where cust_id='$cid'") or die(mysqli_error($con));
                                    $rowb = mysqli_fetch_array($queryb);
                                    $balance = $rowb['balance'];

                                    if ($balance > 0)
                                        $disabled = "disabled=true";
                                    else {
                                        $disabled = "";
                                    }
                                    ?>

                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Prod no</th>
                                                <th>Customer Name</th>
                                                <th>qty</th>
                                                <th>Price</th>
                                                <th>Total</th>
                                                <th>Remove</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $user_id = $_SESSION['id'];
                                            // $selected_cust_id = $_SESSION['selected_cust_id'];
                                            $query = mysqli_query($con, "SELECT * FROM credit_temp ") or die(mysqli_error($con));
                                            $grand = 0;
                                            $totalDiscount = 0;
                                            $newPrice = 0;
                                            while ($row = mysqli_fetch_array($query)) {
                                                $id = $row['prod_id'];
                                                $amount = $row['amount'];
                                                $delete = $row['id'];
                                                $cname = $row['name'];
                                                $description = $row['description'];
                                                // Calculate Total for each row
                                                $invoiceNoDisplay = ($id == 0) ? "N/A" : $id;
                                                $Total = $amount;
                                            ?>
                                                <tr>
                                                    <td> <?php echo $invoiceNoDisplay; ?></td>
                                                    <td><?php echo $row['name']; ?></td>
                                                    <td><?php echo $row['qty']; ?></td>
                                                    <td><?php echo $row['price']; ?></td>
                                                    <td><?php echo number_format($Total, 2); ?></td>
                                                    <!-- Add a "Delete" button -->
                                                    <td>
                                                        <button class="btn btn-danger" onclick="confirmDelete('<?php echo $delete; ?>')">Delete</button>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-warning" href="#" data-toggle="modal" data-target="#credit_edit_<?php echo $delete; ?>">Edit</a>
                                                    </td>

                                                </tr>

                                                <div id="credit_edit_<?php echo $delete; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="height:auto">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title">Edit credit</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form class="form-horizontal" method="post" action="update_row.php" enctype='multipart/form-data'>
                                                                    <div class="col-md-12">

                                                                    </div>

                                                                    <input type="hidden" class="form-control" id="price" value="<?php echo $cname ?>" name="name" required autocomplete="off">

                                                                    <label>Description:</label>
                                                                    <input type="text" class="form-control" id="price" value="<?php echo $description ?>" name="description" required autocomplete="off">
                                                                    <label>qty:</label>
                                                                    <input type="text" class="form-control" id="price" value="<?php echo $row['qty']; ?>" name="qty" required autocomplete="off">
                                                                    <label>price:</label>
                                                                    <input type="text" class="form-control" id="price" value="<?php echo $row['price']; ?>" name="price" required autocomplete="off">

                                                                    <input type="hidden" class="form-control" id="price" value="<?php echo $Total; ?>" name="amount" required autocomplete="off">
                                                                    <input type="hidden" class="form-control" name="cust_id" value="<?php echo $cust_id; ?>">
                                                                    <input type="hidden" class="form-control" name="delete" value="<?php echo $delete; ?>">

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary" name="edit_credit">edit</button>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <!--end of modal-dialog-->
                                                </div>

                                            <?php
                                            }
                                            ?>
                                        </tbody>

                                    </table>
                                </div><!-- /.box-body -->

                            </div>





                            </form>
                        </div><!-- /.box-body -->


                        <?php
                        $query = mysqli_query($con, "SELECT amount FROM credit_temp") or die(mysqli_error($con));

                        $grandTotal = 0;

                        // Loop through the query result and calculate the sum
                        while ($row = mysqli_fetch_assoc($query)) {
                            $grandTotal += $row['amount'];
                        }
                        ?>



                    </div>
            </div>

            <div class="col-md-3">
                <div class="box box-primary">

                    <div class="box-body">
                        <!-- Date range -->
                        <form method="post" name="autoSumForm" action="credit_complete.php" onsubmit="return confirm('Are you sure you want to complete this action?');">
                            <div class="form-group com">
                                <label>Grand Total</label>
                                <input class="form-control center" style="text-align: center;" type="text" value="<?php echo number_format($grandTotal, 2); ?>" readonly>
                            </div>
                            <div class="form-group com">
                                <label>Message displayed on credit Note</label>
                                <textarea name="mc" form-control required></textarea>
                            </div>
                            <div class="form-group com">
                                <label>Message on Statement</label>
                                <textarea name="ms" form-control required> </textarea>
                            </div>
                            <button class="btn btn-lg btn-block btn-primary" id="daterange-btn" name="complete" type="submit" tabindex="7">
                                Complete
                            </button>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <?php
        include('../dist/includes/dbcon.php');

        if (isset($_POST['id'])) { // Corrected parameter name
            $invoiceId = $_POST['id'];

            // Perform the delete operation based on the invoice id
            $deleteQuery = "DELETE FROM credit_temp WHERE id = '$invoiceId'"; // Corrected column name

            if (mysqli_query($con, $deleteQuery)) {
                // Deletion was successful
                echo "success";
            } else {
                // Error occurred during deletion
                echo "error";
            }

            mysqli_close($con);
        } else {
            // echo "Invalid request.";
        }
        ?> </section><!-- /.content -->


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
    <script>
        function confirmEdit(editId) {
            // Use the editId to target the correct modal
            var modalId = 'credit_edit_' + editId;

            // Open the corresponding modal
            $('#' + modalId).modal('show');
        }
    </script>


</body>

</html>