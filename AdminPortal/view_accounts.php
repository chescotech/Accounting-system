<?php session_start(); 
error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Supplier | <?php include('../dist/includes/title.php'); ?></title>
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
    <style>
        #selectedRowsList {
            display: none !important;
        }

        form .left .form-group {
            margin-right: 1rem !important;
        }

        .header {
            margin: 1rem;
            border: 2px solid black;
        }

        .header form,
        label {
            margin: 1.8rem;
        }

        h3 {
            padding: 1.5rem 0 1rem 5rem;
        }

        form input,
        select {
            padding: 0.7rem;
            width: fit-content;
        }


        .form-group select {
            height: 2.7em;
        }

        .form-inline {
            margin: 1rem;
        }

        .form-group {
            padding: 1rem;
        }

        textarea {
            width: 30rem;
            height: 10rem;
        }

    </style>
</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav">
    <div class="wrapper">
        <?php
        include('../dist/includes/header_admin.php');
        include('../dist/includes/dbcon.php');
        ?>
        <!-- Full Width Column -->
        <div class="content-wrapper">
            <div class="container">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        <a class="btn btn-lg btn-warning" href="javascript:void(0)" onclick="window.history.back()">Back</a>
                        <a class="btn btn-lg btn-primary" href="view_accounts.php" >View Accounts</a>      
                        <a class="btn btn-lg btn-primary" href="../user/recieve_payment.php">Recieve Payment</a>
                        <a class="btn btn-lg btn-primary" href="supplier_payments.php">Payments</a>             

                    </h1>
                    
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Supplier</li>
                    </ol>
                </section>


                <section class="content">

                <div class="container-fluid">
                    <div class="header" style="text-align: center;">                        
                        <h3>Accounts</h3>                        
                    </div>
                    <div class="body">
                        <div class="table">
                        <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>NAME</th>
                                        <th>ACCOUNT NAME</th>
                                        <th>CURRENCY</th>
                                        <th>ACCOUNT CODE</th>                                        
                                        <th>ROUTING NO.</th>                                       
                                        <th>DESCRIPTION</th>                                       
                                        <th>DEBIT</th>                                       
                                        <th>CREDIT</th>                                       
                                        <th>TOTAL</th>                                       
                                        <th>BANK RECONCILIATION</th>                                       
                                        <th>EDIT</th>                                       
                                    </tr>
                                </thead>
                                <tbody>                                

                                    <?php
                                    $queryv = mysqli_query($con, "SELECT * FROM bank") or die(mysqli_error($con));
                                    while ($rowv = mysqli_fetch_array($queryv)) {
                                    ?>                            
                                        <tr>
                                            <td><?php echo $rowv['bank_name']; ?></td>
                                            <td><?php echo $rowv['account_name']; ?></td>
                                            <td><?php echo $rowv['currency']; ?></td>
                                            <td><?php echo $rowv['account_code']; ?></td>
                                            <td><?php echo $rowv['routing_number']; ?></td>
                                            <td><?php echo $rowv['description']; ?></td>
                                            <td><?php echo $rowv['debit']; ?></td>
                                            <td><?php echo $rowv['credit']; ?></td>
                                            <td><?php echo $rowv['total']; ?></td>                                           
                                            <!-- <td>
                                                <a href="accounthistory.php?id=<?php echo $row['id'];  ?>">Account History</a>                                                
                                                
                                            </td>       -->
                                            <td>
                                                <a href="bank_account_history.php?id=<?php echo $rowv['id'];  ?>" class="btn btn-success">Reconcile</a>                                                
                                                
                                            </td>                            
                                            <td>
                                                <a href="bank_edit?id=<?php echo $rowv['id']; ?>" data-toggle="modal" class="small-box-footer"><i class="glyphicon glyphicon-edit text-blue mr-2"></i></a>
                                                <a href="bank_delete?id=<?php echo $rowv['id']; ?>" class="small-box-footer danger" onclick="return confirm('Are you sure you want to delete Bank')"><i class="glyphicon glyphicon-trash text-red mr-2 danger"></i></a>
                                            </td>                                           
                                        </tr> 
                                        <?php include './modals.php' ?>                                                                                                                          
                                        
                                        <?php  } ?>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

                </section>
            </div>
        </div>
        <?php include('../dist/includes/footer.php'); ?>
    </div>
    <script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
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





    <?php include './modals.php' ?>

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
        }); </script> </body>
        </html>