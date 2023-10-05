<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Expenses | <?php include('../dist/includes/title.php'); ?></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <!-- <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css"> -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../plugins/select2/select2.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- JavaScript/jQuery (Note: Bootstrap 3.3.5 requires jQuery 1.9.1+) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <style>
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

        .drop-area {
            border: 2px dashed #ccc;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            margin: 2rem 2rem 2rem 0rem;
            width: 100%;
        }
    </style>
    <script>
        // Reload the page after script execution
        window.onload = function() {
            if (window.location.href.includes('?submitted')) {
                location.reload();
            }
        };
    </script>

</head>

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav">
    <div class="wrapper">
        <?php
        include('../dist/includes/header_admin.php');
        include('../dist/includes/dbcon.php');

        $id = $_GET['id'];


        $user_query = mysqli_query($con, "SELECT * FROM payment_account WHERE id = '$id' ") or die(mysqli_error($con));
        while ($row = mysqli_fetch_array($user_query)) {
            $name = $row['name'];
            $balance= $row['balance'];
        }

        $sup = mysqli_query($con, "SELECT expenses_tb.pay_acc_id, supplier.supplier_name FROM supplier INNER JOIN expenses_tb ON expenses_tb.supplier_id = supplier.supplier_id  WHERE expenses_tb.pay_acc_id = '$id' ") or die(mysqli_error($con));

        $rowz = mysqli_fetch_array($sup);
        $supname = $rowz['supplier_name'];



        ?>

        <div class="content-wrapper">
            <div class="container-fluid" style="background: rgba(255, 255, 255, 0.6);">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        <a class="btn btn-lg btn-warning" href="javascript:void(0);" onclick="window.history.back();">Back</a>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">General Expenses</li>
                    </ol>
                </section>

                <?php 
                $color ='';
                if($balance <= 0){
                    $color ='RED';
                } else {
                    $color =' green';
                }
                ?>


                <div class="container-fluid">
                    <div class="header" >
                        <p style="text-align: center;  font-size :25px;"><?php echo $name ?> Account </p>
                        <p style="text-align: center;"> Current Balance</p>
                        <p style="text-align: center; font-size :25px; color:<?php echo $color ?>; font-weight:bolder;"> K <?php echo number_format($balance,2) ?> </p>
                    </div>
                    <div class="body">
                        <div class="table">

                            <?php
                          $query = "SELECT 'Expense' AS type, date, amount AS amount, e.pay_acc_id, supplier_id, NULL AS customer_id, balance FROM expenses_tb AS e WHERE e.pay_acc_id = '$id'
                          UNION
                          SELECT 'Sale' AS type, date_added AS date, amount_due AS amount, s.pay_acc_id, NULL AS supplier_id, customer_id, balance FROM sales AS s 
                          WHERE s.pay_acc_id = '$id' ORDER BY date DESC";
                  
                            $result = mysqli_query($con, $query);

                            if (!$result) {
                                die("Query failed: " . mysqli_error($con));
                            }

                            ?>
                            <table id="expense_table" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>DATE</th>
                                        <th>TYPE</th>
                                        <th>REF NO</th>
                                        <th>PAYEE ACCOUNT</th>
                                        <th>INCREASE</th>
                                        <th>DECREASE</th>
                                        <th>BALANCE</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                   
                                    if ($result) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            // Initialize payee name variable
                                            $payee_name = "";

                                            if ($row['type'] === 'Sale') {
                                                // Fetch customer name based on customer_id
                                                $customer_id = $row['customer_id'];
                                                $customer_query = "SELECT cust_first FROM customer WHERE cust_id = '$customer_id'";
                                                $customer_result = mysqli_query($con, $customer_query);

                                                if ($customer_result) {
                                                    $customer_row = mysqli_fetch_assoc($customer_result);
                                                    $payee_name = $customer_row['cust_first'];
                                                } else {
                                                    die("Customer query failed: " . mysqli_error($con));
                                                }
                                            } elseif ($row['type'] === 'Expense') {
                                                // Fetch supplier name based on supplier_id
                                                $supplier_id = $row['supplier_id'];
                                                $supplier_query = "SELECT supplier_name FROM supplier WHERE supplier_id = '$supplier_id'";
                                                $supplier_result = mysqli_query($con, $supplier_query);

                                                if ($supplier_result) {
                                                    $supplier_row = mysqli_fetch_assoc($supplier_result);
                                                    $payee_name = $supplier_row['supplier_name'];
                                                } else {
                                                    die("Supplier query failed: " . mysqli_error($con));
                                                }
                                            }
                                    ?>
                                            <tr>
                                                <td><?php echo $row['date']; ?></td>
                                                <td><?php echo $row['type']; ?></td>
                                                <td> </td>
                                                <td><?php echo $payee_name; ?></td>
                                                <td><?php
                                                    if ($row['type'] === 'Sale') {
                                                        echo $row['amount'];
                                                        $balance = $row['balance'] + $row['amount']; // Increase the balance for sales
                                                    }
                                                    ?></td>
                                                <td><?php
                                                    if ($row['type'] === 'Expense') {
                                                        echo $row['amount'];
                                                        $balance = $row['balance'] - $row['amount']; // Decrease the balance for expenses
                                                    }
                                                    ?></td>
                                                <td><?php echo $balance; ?></td>
                                            </tr>
                                    <?php
                                        }
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>

                    </div>


                </div>

            </div>

        </div><!-- /.content-wrapper -->
        <?php include('../dist/includes/footer.php'); ?>
    </div>
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
            $('#expense_table').DataTable({
                "paging": true,
                "pageLength": 10,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": true
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
        });
    </script>

    <?php if (isset($errorMessage)) : ?>
        <script>
            alert('<?php echo $errorMessage; ?>');
        </script>
    <?php elseif (isset($successMessage)) : ?>
        <script>
            alert('<?php echo $successMessage; ?>');
        </script>
    <?php endif; ?>
    <script>
        // Reload the page after script execution
        window.onload = function() {
            if (window.location.href.includes('?submitted')) {
                location.reload();
            }
        };
    </script>

</body>




</html>