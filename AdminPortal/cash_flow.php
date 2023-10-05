<?php

error_reporting(0);
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
            /* overflow-y: scroll;
            max-height: 150px;
            width: 30rem; */
        }

        .checkbox-group .checkbox-list span {
            display: none;
            margin-bottom: 5px;
            /* Adjust the value as needed */
        }
    </style>
</head>

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav">
    <div class="wrapper">
        <!-- ... (rest of your HTML content) ... -->
        <?php
        include('../dist/includes/header_admin.php');
        include('../Objects/Objects.php');
        $Objects = new InvObjects();
        if (isset($_POST['display'])) {
            $date = $_POST['date'];
            $date = explode('-', $date);
            $start = date("Y-m-d", strtotime($date[0]));
            $end = date("Y-m-d", strtotime($date[1]));

            if (isset($_POST['branch_id'])) {

                if (in_array('all_branches', $_POST['branch_id'])) {
                    $branch_ids = ['all_branches'];
                } else {
                    $branch_ids = array_map('intval', $_POST['branch_id']);
                }
            } else {

                $branch_ids = [];
            }


            $branch_condition = '';
            if (!empty($branch_ids)) {
                $branch_ids_str = implode(',', $branch_ids);
                $branch_condition = "AND id IN ($branch_ids_str)";
            }

            $query = mysqli_query($con, "
                SELECT
                    'sales' AS source_table,
                    date AS transaction_date,
                    id AS reference,
                    'PAY' AS transaction_code,
                    description AS description,
                    NULL AS debit,
                    name,
                    balance AS credit
                FROM payment_account
                WHERE date BETWEEN '$start' AND DATE_ADD('$end', INTERVAL 1 DAY)
                $branch_condition
                ORDER BY transaction_date
            ") or die(mysqli_error($con));
        }
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

                                        <div class="form-group">

                                            <div class="checkbox-group checkbox-list" style="display: inline-block;">

                                                <span>
                                                    <input type="hidden" id="all_branches" name="branch_id" value="all_branches">

                                                </span>
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
                                        <h3 class="box-title" style=" color: black"><b>Cash Flow Report</b></h3>
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
                                                    <th></th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="2">ASSETS AND INCOME</td>
                                                </tr>
                                                <?php
                                                $totalSold = 0;

                                                while ($row = mysqli_fetch_array($query)) {
                                                    // Calculate the total sales for this payment account
                                                    $salesQuery = mysqli_query($con, "SELECT SUM(amount_due) AS total_sales FROM sales WHERE pay_acc_id = {$row['reference']}") or die(mysqli_error($con));
                                                    $salesRow = mysqli_fetch_array($salesQuery);
                                                    $totalSales = $salesRow['total_sales'];

                                                    // Display the transaction details under "Assets and Income"
                                                    echo '<tr>';
                                                    echo '<td style="width: 75%;">' . $row['reference'] . '</td>';
                                                    echo '<td><br>' . 'K ' . number_format($totalSold, 2) . '</td>';
                                                    echo '</tr>';

                                                    $totalSold += $totalSales;
                                                }
                                                ?>
                                                <tr>
                                                    <td colspan="2">EXPENSES</td>
                                                </tr>
                                                <?php
                                                $totalExpenses = 0;

                                                mysqli_data_seek($query, 0); // Reset the query pointer to the beginning

                                                while ($row = mysqli_fetch_array($query)) {
                                                    // Fetch and calculate the total expenses for this payment account
                                                    $expensesQuery = mysqli_query($con, "SELECT *, SUM(amount) AS total_expenses FROM expenses_tb WHERE pay_acc_id = {$row['reference']}") or die(mysqli_error($con));
                                                    $expensesRow = mysqli_fetch_array($expensesQuery);
                                                    $totalExpenses = $expensesRow['total_expenses'];

                                                    // Display the transaction details under "Expenses"
                                                    echo '<tr>';
                                                    echo '<td style="width: 75%;">' . $expensesRow['category'] . '</td>';
                                                    echo '<td><br>' . 'K ' . number_format($totalExpenses, 2) . '</td>';
                                                    echo '</tr>';
                                                }
                                                ?>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                    </section>
                </section>
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
            // Trigger change event to initially check the "All Branches" checkbox
            $('#all_branches').prop('checked', true).trigger('change');

            $('#all_branches').on('change', function() {
                if (!$(this).prop('checked')) {
                    $(this).prop('checked', true); // Prevent unchecking
                }
                $('.checkbox-list input[type="checkbox"]').prop('checked', true);
            });

            $('#search').on('keyup', function() {
                var searchTerm = $(this).val().toLowerCase().trim();
                $('.checkbox-list span').each(function() {
                    var checkboxText = $(this).text().trim().toLowerCase();
                    var shouldShow = checkboxText.indexOf(searchTerm) > -1 || searchTerm === '';

                    // Check if it's the "All Branches" checkbox
                    if ($(this).find('input').attr('id') === 'all_branches') {
                        shouldShow = true; // Always show the "All Branches" checkbox
                    }

                    $(this).toggle(shouldShow);
                });
            });
        });
    </script>



</body>

</html>