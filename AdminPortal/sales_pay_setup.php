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

                    </h1>
                    
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Supplier</li>
                    </ol>
                </section>


                <section class="content">

                    <form class="payment" action="bank_primary.php" method="POST" style="width: 100rem;">
                        <div class="left" style="display: flex !important;
                                   flex-direction: row !important;
                                   justify-content: flex-start !important;">
                                <div class="form-group com">
                                <label>Bank Name</label>
                                <select class="form-control" name="selected_bank" id="selected_bank">
                                    <option value="">--Select Bank--</option>
                                    <?php
                                    $query = mysqli_query($con, "SELECT id, bank_name FROM bank ORDER by bank_name") or die(mysqli_error($con));
                                    while ($row = mysqli_fetch_assoc($query)) {
                                        $bank_id = $row['id'];
                                        $expName = $row['bank_name'];
                                        echo "<option value='$bank_id'>$expName</option>";
                                    }
                                    ?>
                                </select>
                            </div>

                            <input type="hidden" name="selected_bank_name" value="">

                            <div class="form-group com">
                                <label>Bank Account Name</label>
                                <select class="form-control" name="selected_account" id="selected_account">
                                    <option value="">--Select Bank Account--</option>
                                </select>
                            </div>

                            <div class="form-group com">
                                <label>Business Account</label>
                                <select class="form-control" name="payment_account">
                                    <option value="">--Select payment method--</option>
                                    <?php
                                    $query = mysqli_query($con, "SELECT * FROM payment_account ORDER by name") or die(mysqli_error($con));
                                    while ($row = mysqli_fetch_assoc($query)) {
                                        $expName = $row['name'];
                                        echo "<option value='$expName'>$expName</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            <br>
                        </div>
                        <div class="left" style="display: flex !important;
                                   flex-direction: row !important;
                                   justify-content: flex-start !important;">
                            

                            <div class="right" style="display: flex !important;
                                flex-direction: row !important;
                                justify-content: flex-end !important;">
                               
                                
                        <div class="modal-footer">         
                            <button type="submit" class="btn btn-primary">Add Bank</button>
                        </div>
                    </form>

                    <script>
                            document.querySelector('#selected_bank').addEventListener('change', function() {
                                var selectedBankId = this.value;
                                var accountSelect = document.querySelector('#selected_account');
                                accountSelect.innerHTML = '<option value="">Loading...</option>';
                                var xhr = new XMLHttpRequest();
                                xhr.open('POST', '../user/fetch_accounts.php', true);
                                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                xhr.onreadystatechange = function() {
                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                        accountSelect.innerHTML = xhr.responseText;
                                    }
                                };
                                xhr.send('bank_id=' + selectedBankId);
                            });
                        </script>


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