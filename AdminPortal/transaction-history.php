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
    <title>Sales Report | <?php include('../dist/includes/title.php'); ?></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="../plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="../plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="../plugins/select2/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">

    <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <script type="text/javascript" src="../dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="../dist/js/moment.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../dist/css/bootstrap.css" />

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="../plugins/daterangepicker/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="../plugins/daterangepicker/daterangepicker.css" />

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="../plugins/datatables/table-exporter.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {
            'packages': ['corechart']
        });
        google.charts.setOnLoadCallback(line_chart);

        function line_chart() {
            var jsonData = $.ajax({
                url: 'get-sales-revenue-stats.php',
                dataType: "json",
                async: false,
                success: function(jsonData) {
                    var options = {
                        legend: 'none',
                        hAxis: {
                            minValue: 0,
                            maxValue: 9
                        },
                        curveType: 'function',
                        pointSize: 7,
                        dataOpacity: 0.3
                    };
                    var data = new google.visualization.arrayToDataTable(jsonData);
                    var chart = new google.visualization.LineChart(document.getElementById('line_chart'));
                    chart.draw(data, options);
                }
            }).responseText;
        }
    </script>

    <style type="text/css">
        h5,
        h6 {
            text-align: center;
        }

        @media print {
            .btn-print {
                display: none !important;
            }

            .main-footer {
                display: none !important;
            }

            .box.box-primary {
                border-top: none !important;
            }

            .angel {
                display: none !important;
            }

        }

        .col-lg-2 span {
            display: list-item;
        }


        label {
            display: contents !important;
        }

        .checkbox-group {
            overflow-y: scroll;
            max-height: 150px;
            width: 30rem;
        }
        .checkbox-group .checkbox-list span {
        display: none;
        margin-bottom: 5px; /* Adjust the value as needed */
    }
    </style>
</head>

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav">
    <div class="wrapper">
        <?php
        include('../dist/includes/header_admin.php');
        include('../Objects/Objects.php');
        $Objects = new InvObjects();
        ?>
        <div class="content-wrapper">
            <div class="container">
                <section class="content">
                    <div class="col-md-20">
                        <div class="box box-primary angel">
                            <div class="box-header">
                                <h3 class="box-title">Filter Report By Date Period</h3>
                            </div>
                            <div class="box-body">
                                <form method="post">
                                    <div class="form-group col-md-6">
                                        <label>Select Report Dates</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" name="date" class="form-control pull-right active" id="reservation" required autocomplete="off">
                                        </div>
                                    </div>

                                    <div class="col-lg-2">
                                        <label>Select Account</label>
                                        <div class="form-group">
                                            <label for="branch_id">Customers</label>
                                            <div class="checkbox-group checkbox-list" style="display: inline-block;">
                                            <input type="text" id="search" placeholder="Search Customers"><br>
                                                <span><input type="checkbox" id="all_branches" name="branch_id" value="all_branches"> <label for="all_branches">All Accounts</label></span>
                                                <?php
                                                $queryc = mysqli_query($con, "SELECT cust_id, cust_first, cust_last FROM customer GROUP BY cust_first, cust_last ORDER BY cust_first") or die(mysqli_error($con));

                                                if (!$queryc) {
                                                    die("Query failed: " . mysqli_error($con));
                                                }

                                                while ($rowc = mysqli_fetch_array($queryc)) {
                                                ?>
                                                    <span>
                                                        <input type="checkbox" id="<?php echo $rowc['cust_id']; ?>" name="branch_id[]" value="<?php echo $rowc['cust_id']; ?>">
                                                        <label for="<?php echo $rowc['cust_id']; ?>"><?php echo $rowc['cust_first'] . ' ' . $rowc['cust_last']; ?></label>
                                                    </span>
                                                <?php
                                                }
                                                ?>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-primary" name="display"> Generate Report </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title" style=" color: black"><b>Transaction Report</b></h3>
                                    </div>
                                    <?php
                                    if (isset($_POST['display'])) {
                                        $_SESSION['sales_date'] = $_POST['date'];
                                    } else {
                                        unset($_SESSION['sales_date']);
                                    }
                                    ?>
                                    <div class="box-body">
                                        <button id="btnExport" onclick="javascript:xport.toCSV('transaction_statement');"> Export to CSV</button>

                                        <form target="_blank" action="transaction_statement_pdf.php" method="post">
                                            <input hidden="hidden" name="date" value="<?php
                                                                                        if (isset($_POST['display'])) {
                                                                                            echo $_POST['date'];
                                                                                        }
                                                                                        ?>">

                                            <input hidden="hidden" name="branch_id" value="<?php
                                                                                            if (isset($_POST['display'])) {
                                                                                                echo $_POST['branch_id'];
                                                                                            }
                                                                                            ?>">

                                            <input hidden="hidden" name="toll_id" value="<?php
                                                                                            if (isset($_POST['toll_id'])) {
                                                                                                echo $_POST['toll_id'];
                                                                                            }
                                                                                            ?>">

                                            <?php
                                            if (isset($_POST['display'])) {
                                                echo ' <button type="submit"  name="save" id="save" type="button" class="btn btn-default"><span class="glyphicon glyphicon-print"></span>Export to PDF
                                            </button>';
                                            }
                                            ?>
                                        </form>
                                        <table id="transaction_statement" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Date</th>
                                                    <th>Reference</th>
                                                    <th>Account</th>
                                                    <th>Transaction Detail</th>
                                                    <th>Debit</th>
                                                    <th>Credit</th>
                                                    <th>Balance</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $totalSold = 0;
                                                $totalAmountCollected = 0;
                                                $totalDebit = 0;
                                                $totalCredit = 0;
                                                $balance = 0;
                                                $total_balance = 0;
                                                $total_credit = 0;
                                                $total_debit = 0;

                                                if (isset($_POST['display'])) {

                                                    $date = $_POST['date'];
                                                    $date = explode('-', $date);
                                                    $branch = $_SESSION['branch'];
                                                    $start = date("Y-m-d", strtotime($date[0]));
                                                    $startDate = $start . " 00:00:00";
                                                    $end = date("Y-m-d", strtotime($date[1]));
                                                    $endDate = $end . " 00:00:00";
                                                    $stop_date = date('Y-m-d H:i:s', strtotime($endDate . ' +1 day'));
                                                    $branch_id = $_POST['branch_id'];

                                                    if (empty($branch_id)) {
                                                        echo '<script>alert("Please select at least one Account");</script>';

                                                    } else if ($branch_id != "all_branches") {
                                                        $query = mysqli_query($con, "SELECT date_added,order_no,amount_due,customer.cust_first,customer.cust_last FROM `sales`"
                                                            . " INNER JOIN customer on customer.cust_id=sales.customer_id  "
                                                            . "AND date_added BETWEEN '$startDate' AND '$stop_date'  AND sales.customer_id IN ('" . implode("','", $branch_id) . "') ") or die(mysqli_error($con));
                                                    } else {

                                                        $query = mysqli_query($con, "SELECT date_added,order_no,amount_due,customer.cust_first,customer.cust_last FROM `sales`"
                                                            . " INNER JOIN customer on customer.cust_id=sales.customer_id  "
                                                            . "AND date_added BETWEEN '$startDate' AND '$stop_date'") or die(mysqli_error($con));
                                                    }

                                                    echo ' <center><h3 class="box-title" style=" color: black"><b><u>Transaction Report from ' . $start . ' to ' . $end . '</u></b></h3></center>';
                                                } else {
                                                    //  $query = mysqli_query($con, "SELECT stock_branch_id,SUM(qty) AS qty,prod_name,prod_desc,name, sales_details.price AS prod_sell_price,sales.date_added  FROM sales_details INNER JOIN sales ON sales.sales_id=sales_details.sales_id INNER JOIN user ON user.user_id = sales.user_id INNER JOIN product ON product.prod_id = sales_details.prod_id AND DATE(sales.date_added) = DATE(NOW()) GROUP BY prod_name,stock_branch_id,sales_details.price")or die(mysqli_error($con));
                                                    $query = mysqli_query($con, "SELECT date_added,order_no,amount_due,customer.cust_first,customer.cust_last FROM `sales`"
                                                        . " INNER JOIN customer on customer.cust_id=sales.customer_id  "
                                                        . "AND DATE(date_added)= DATE(NOW())") or die(mysqli_error($con));
                                                    echo ' <center><h3 class="box-title" style=" color: black"><b><u>Todays Transactions Report</u></b></h3></center><br>';
                                                }
                                                while ($row = mysqli_fetch_array($query)) {
                                                    //$totalSold = $row['qty'] * $row['prod_sell_price'];
                                                    //$totalAmountCollected += $totalSold;
                                                ?>
                                                    <tr>
                                                        <td><?php echo date("M d, Y", strtotime($row['date_added'])); ?></td>
                                                        <td><?php echo $row['order_no']; ?></td>

                                                        <td><?php echo $row['cust_first'] . ' ' . $row['cust_last']; ?></td>
                                                        <td><?php echo ' Invoice : ' . $row['order_no']; ?></td>
                                                        <td><?php
                                                            $totalDebit += $row['amount_due'];
                                                            echo $row['amount_due'];
                                                            ?></td>

                                                        <td><?php
                                                            $invoice_no = $row['order_no'];
                                                            $damagesQuery = mysqli_query($con, "SELECT SUM(amount) AS credit FROM `credit_payments` "
                                                                . "WHERE invoice_no='$invoice_no' "
                                                                . "GROUP BY invoice_no ") or die(mysqli_error($con));

                                                            $Rows = mysqli_fetch_array($damagesQuery);

                                                            if (mysqli_num_rows($damagesQuery) > 0) {
                                                                $totalCredit = $Rows['credit'];
                                                                $total_credit += $totalCredit;
                                                                echo $Rows['credit'];
                                                            } else {
                                                                $totalCredit = 0;
                                                                echo '0.00';
                                                            }
                                                            ?></td>
                                                        <td><?php
                                                            $balance = $row['amount_due'] - $totalCredit;
                                                            $total_balance += $balance;

                                                            echo $balance;
                                                            ?></td>

                                                    </tr>
                                                <?php
                                                }
                                                $vat = 0.16 * $totalAmountCollected;
                                                ?>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td><?php echo number_format($totalDebit, 2); ?></td>
                                                    <td></td>
                                                    <td><?php echo 'K ' . number_format($total_balance, 2); ?></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!-- /.box-body -->
                                </div>
                            </div>
                    </section><!-- /.content -->
                </section><!-- /.content -->
            </div>
        </div>
        <?php include('../dist/includes/footer.php'); ?>
    </div>
    <script src="../plugins/jQuery/jQuery-2.2.0.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../plugins/select2/select2.full.min.js"></script>
    <script src="../plugins/input-mask/jquery.inputmask.js"></script>
    <script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <!-- date-range-picker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
    <script src="../plugins/daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap datepicker -->
    <script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- bootstrap color picker -->
    <script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <!-- bootstrap time picker -->
    <script src="../plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <!-- SlimScroll 1.3.0 -->
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- iCheck 1.0.1 -->
    <script src="../plugins/iCheck/icheck.min.js"></script>
    <!-- FastClick -->
    <script src="../plugins/fastclick/fastclick.js"></script>
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
                "paging": false,
                buttons: [
                    'csv', 'excel', 'pdf', 'print'
                ],
                "lengthChange": false,
                "searching": true,
                "ordering": false,
                "info": true,
                "autoWidth": false
            });
            //Initialize Select2 Elements
            $(".select2").select2();
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
                    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }
            );

            //Date picker
            $('#datepicker').datepicker({
                autoclose: true
            });

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
        $(document).ready(function() {
            $('#all_branches').on('change', function() {
                if ($(this).prop('checked')) {
                    $('.checkbox-list input[type="checkbox"]').prop('checked', true);
                } else {
                    $('.checkbox-list input[type="checkbox"]').prop('checked', false);
                }
            });
        });

        $(document).ready(function() {
            $('#search').on('keyup', function() {
                var searchTerm = $(this).val().toLowerCase().trim();
                $('.checkbox-list span').each(function() {
                    var checkboxText = $(this).text().trim().toLowerCase();
                    var shouldShow = checkboxText.indexOf(searchTerm) > -1 || searchTerm === '';

                    // Check if it's the "All Customers" checkbox
                    if ($(this).find('keyup').attr('id') === 'all_branches') {
                        shouldShow = true; // Always show the "All Customers" checkbox
                    }

                    $(this).toggle(shouldShow);
                });
            });
        });
    </script>




</body>

</html>