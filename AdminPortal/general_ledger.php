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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


    <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <!-- <script type="text/javascript" src="../dist/js/jquery.min.js"></script> -->
    <script type="text/javascript" src="../dist/js/moment.min.js"></script>
    <!-- <link rel="stylesheet" type="text/css" href="../dist/css/bootstrap.css" /> -->

    <!-- Include Date Range Picker -->
    <!-- <script type="text/javascript" src="../plugins/daterangepicker/daterangepicker.js"></script> -->
    <!-- <link rel="stylesheet" type="text/css" href="../plugins/daterangepicker/daterangepicker.css" /> -->

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
            margin-bottom: 5px;
            /* Adjust the value as needed */
        }

        .hidden {
        display: none;
    }

    </style>
</head>

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav">
    <div class="wrapper">
        <?php
        include('../dist/includes/header_admin.php');
        include('../Objects/Objects.php');
        $Objects = new InvObjects();
        if (isset($_POST['display'])) {
            $date = $_POST['date'];
            $date = explode('-', $date);
            $start = date("Y-m-d", strtotime($date[0]));
            $end = date("Y-m-d", strtotime($date[1]));
            $branch_id = $_POST['branch_id'];
            if (!is_array($branch_id)) {
                $branch_id = [$branch_id];
            }

            // Sanitize the array of branch IDs
            $branch_ids = array_map(function ($branch_id) use ($con) {
                return mysqli_real_escape_string($con, $branch_id);
            }, $branch_id);

            // Convert the sanitized IDs to a comma-separated string
            $branch_ids_str = "'" . implode("','", $branch_ids) . "'";

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
        AND id IN ($branch_ids_str)
    ORDER BY transaction_date  -- Order by transaction_date
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
                                        <label>Select Account</label>
                                        <div class="form-group">
                                            <label for="branch_id">Customers</label>
                                            <div class="checkbox-group checkbox-list" style="display: inline-block;">
                                                <input type="text" id="search" placeholder="Search Accounts"><br>
                                                <span><input type="checkbox" id="all_branches" name="branch_id" value="all_branches"> <label for="all_branches">All Accounts</label></span>
                                                <?php
                                                $queryc = mysqli_query($con, "SELECT MIN(id) AS id, name FROM payment_account GROUP BY name ORDER BY name") or die(mysqli_error($con));


                                                if (!$queryc) {
                                                    die("Query failed: " . mysqli_error($con));
                                                }

                                                while ($rowc = mysqli_fetch_array($queryc)) {
                                                ?>
                                                    <span>
                                                        <input type="checkbox" id="<?php echo $rowc['id']; ?>" name="branch_id[]" value="<?php echo $rowc['id']; ?>">
                                                        <label for="<?php echo $rowc['id']; ?>"><?php echo $rowc['name']; ?></label>
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
                                        <h3 class="box-title" style=" color: black"><b>General ledger Report</b></h3>
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
                                                    <th>S/N</th>
                                                    <th>Date</th>
                                                    <th>Name</th>
                                                    <th>REFERENCE</th>
                                                    <th>TRANSACTION TYPE</th>
                                                    <th>MEMO/DESCRIPTION</th>
                                                    <th>SPLIT</th>
                                                    <th>AMOUNT</th>
                                                    <th>BALANCE</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $totalSold = 0;
                                                $buttonCounter = 0; 
                                                while ($row = mysqli_fetch_array($query)) {
                                                    $totalSold = $row['credit'];

                                                    // Initialize total sales and expenses variables
                                                    $totalSales = 0;
                                                    $totalExpenses = 0;

                                                    // Fetch and calculate the total sales for this payment account
                                                    $salesQuery = mysqli_query($con, "SELECT SUM(amount_due) AS total_sales FROM sales WHERE pay_acc_id = {$row['reference']}") or die(mysqli_error($con));
                                                    $salesRow = mysqli_fetch_array($salesQuery);
                                                    $totalSales = $salesRow['total_sales'];

                                                    // Fetch and calculate the total expenses for this payment account
                                                    $expensesQuery = mysqli_query($con, "SELECT SUM(amount) AS total_expenses FROM expenses_tb WHERE pay_acc_id = {$row['reference']}") or die(mysqli_error($con));
                                                    $expensesRow = mysqli_fetch_array($expensesQuery);
                                                    $totalExpenses = $expensesRow['total_expenses'];

                                                    $buttonCounter++;
                                                    $dataTarget = "details-container-$buttonCounter";
                                                ?>
                                                    <tr>
                                                        <td><?php echo $row['reference']; ?></td>
                                                        <td><?php echo date("M d, Y", strtotime($row['transaction_date'])); ?></td>
                                                        <td><?php echo $row['name']; ?> <br>Current Balance</td>
                                                        <td><?php echo $row['reference']; ?></td>
                                                        <td><?php echo $row['transaction_code']; ?></td>
                                                        <td><?php echo $row['description']; ?></td>
                                                        <td><?php echo $row['debit']; ?></td>
                                                        <td></td>
                                                        <td><br> <?php echo 'K ' . number_format($totalSold, 2); ?></td>
                                                    </tr>
                                            
                                                    <tr>
                                                        <td colspan="9">
                                                            <table>
                                                                <thead>
                                                                    <tr>
                                                                    <button class="toggle-details-button btn btn-success" data-target="<?php echo $dataTarget; ?>">View Details</button>
                                                                    </tr>
                                                                </thead>
                                                                 <tbody class="<?php echo $dataTarget; ?> hidden">
                                                                    <tr>
                                                                        <td style="color:green; font-weight:bold;">Revenue</td>
                                                                    </tr>
                                                                    <?php
                                                                    $salesQuery = mysqli_query($con, "SELECT * FROM sales WHERE pay_acc_id = {$row['reference']}") or die(mysqli_error($con));
                                                                    while ($salesRow = mysqli_fetch_array($salesQuery)) {
                                                                    ?>
                                                                        <tr>
                                                                            <td><?php echo 'Cash Sales' ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="padding-left: 90rem !important;"><?php echo 'K ' . number_format($salesRow['amount_due'], 2); ?></td>
                                                                        </tr>
                                                                    <?php
                                                                    }
                                                                    ?>
                                                                    <tr>
                                                                        <td style="color:crimson; font-weight:bold;">Expenses</td>
                                                                    </tr>
                                                                    <?php
                                                                    $expensesQuery = mysqli_query($con, "SELECT * FROM expenses_tb WHERE pay_acc_id = {$row['reference']}") or die(mysqli_error($con));
                                                                    while ($expensesRow = mysqli_fetch_array($expensesQuery)) {
                                                                    ?>
                                                                        <tr>
                                                                            <td><?php echo $expensesRow['category']; ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="padding-left: 90rem !important;"><?php echo 'K ' . number_format($expensesRow['amount'], 2); ?></td>
                                                                        </tr>
                                                                    <?php
                                                                    }
                                                                    ?>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                <?php
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
    <!-- <script src="../plugins/jQuery/jQuery-2.2.0.min.js"></script> -->
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
    <!-- <script>
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
    </script> -->
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


<script>
    document.addEventListener("DOMContentLoaded", function () {
        const toggleButtons = document.querySelectorAll('.toggle-details-button');

        toggleButtons.forEach(toggleButton => {
            toggleButton.addEventListener('click', () => {
                const targetId = toggleButton.getAttribute('data-target');
                const detailsContainer = document.querySelector(`.${targetId}`);

                if (detailsContainer.classList.contains('hidden')) {
                    detailsContainer.classList.remove('hidden');
                } else {
                    detailsContainer.classList.add('hidden');
                }
            });
        });
    });
</script>



</body>

</html>