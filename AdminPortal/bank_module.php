<?php session_start(); ?>
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

                    </h1>
                    
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Supplier</li>
                    </ol>
                </section>


                <section class="content">

                    <form class="payment" action="add_bank.php" method="POST" style="width: 100rem;">
                        <div class="left" style="display: flex !important;
                                   flex-direction: row !important;
                                   justify-content: flex-start !important;">
                            <div class="form-group">
                                <label for="name">Account Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter bank name" required>
                            </div>

                            <div class="form-group">
                                <label for="bank_name">Account Code</label>
                                <input type="text" class="form-control" id="name" name="code" placeholder="Enter bank name" required>
                            </div>
                            <div class="right" style="display: flex !important;
                                flex-direction: row !important;
                                justify-content: flex-end !important;">
                                <div class="form-group">
                                    <label for="name">Currency</label>
                                    <select class="form-control" name="currency">                                       
                                        <option>ZMW</option>
                                        <option>USD</option>
                                        <option>POUND</option>                                        
                                        <option>EURO</option>                                        
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="bank_name">Account Number</label>
                                    <input type="text" name="acc_number" class="form-control">
                                </div>

                            </div>
                            <br>
                        </div>
                        <div class="left" style="display: flex !important;
                                   flex-direction: row !important;
                                   justify-content: flex-start !important;">
                            <div class="form-group">
                                <label for="name">Bank Name</label>
                                <input type="text" class="form-control" id="name" name="bank_name" placeholder="Enter account name" required>
                            </div>

                            <div class="right" style="display: flex !important;
                                flex-direction: row !important;
                                justify-content: flex-end !important;">
                                <div class="form-group">
                                    <label for="name">Routing Number</label>
                                    <input type="text" class="form-control" id="name" name="routing" placeholder="Enter routing name" required>
                                </div>
                                <div class="form-group">
                                    <label for="bank_name">Opening Balance</label>
                                    <input type="text" name="Balance" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="bank_name">as of</label>
                                    <input type="date" name="date" class="form-control">
                                </div>

                            </div>
                            <br>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="bank_name">Description</label>
                            <textarea type="textarea" class="form-control" id="description" name="description" placeholder="enter description"> </textarea>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add Bank</button>
                        </div>
                    </form>

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