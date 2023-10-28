<?php
session_start();
if (empty($_SESSION['id'])) :
    header('Location:../index.php');
endif;
if (empty($_SESSION['branch'])) :
    header('Location:../index.php');
endif;

error_reporting(E_ALL);
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
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <style>
        .col-lg-3 {
            margin: 50px 0px;
        }

        .small-box {
            background-color: #3498db;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
            height: 16rem;
            /* pointer-events: none !important; */
        }

        .text {
            height: 15px;
        }

        .menu a .inner {
            text-align: center;
            margin: 2rem;
        }

        .menus {
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            padding: 1em;
        }

        .menu {
            display: flex;
            flex-direction: row;
            justify-content: space-evenly;

        }

        .menu .inner h3 {
            margin-top: 5rem;
            font-size: 25px;
            font-weight: 200;
        }

        .menu a:hover {
            transform: scale(2px 1);
        }

        .small-box .icon {
            margin: 4rem;
            pointer-events: none !important;
        }

        .small-box .icon i {
            pointer-events: none !important;
        }

        .menu {
            margin-left: 0px;
            margin-right: 0px;
        }

        .menu .glyphicon {
            font-size: 18rem;
            transform: scale(1);
            /* Set the initial scale */
            transition: transform 0.3s ease;
            border: 2px solid green;
            color: rgba(0, 0, 0, 0.8);
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);

        }

        .menu p {
            transform: scale(1);
            transition: transform 0.3s ease;
            margin: 1.5rem;
            text-align: center;
            color: black;
        }

        .menu p,
        .glyphicon:hover {
            transform: scale(1.1);

        }

        .box-body {
            background: rgba(0, 0, 0, 0.1);
        }

        .box-header {
            background: #3c8d;
            /* background: rgba(0, 0, 0, 0.8); */

            text-align: center;
        }
    </style>
</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav" onload="myFunction()">
    <div class="wrapper">
        <?php
        include('../dist/includes/header.php');
        include('../dist/includes/dbcon.php');
        ?>
        <!-- Full Width Column -->
        <div class="content-wrapper">
            <div class="container-fluid">
                <section class="content">
                    <div class="row">
                        <div class="col-md-18">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title" style=" color: black ;"><b>Home Dashboard</b></h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <div class="menus">
                                        <div class="row menu">
                                            <a href="profile.php" style=" color: white">
                                                <i class="glyphicon glyphicon-user icon" href="profile.php">
                                                </i>
                                                <p>MY ACCOUNT</p>
                                            </a>

                                            <a href="cash_transaction.php" style=" color: white">
                                                <i class="glyphicon glyphicon-credit-card icon" style="color:#3c8d;">
                                                </i>
                                                <p>SALE STOCK</p>
                                            </a>

                                            <?php
                                            ?>
                                            <?php
                                            $query3 = mysqli_query($con, "SELECT COUNT(prod_id) AS prodcount FROM product WHERE prod_qty <=(SELECT notification_count FROM branch)") or die(mysqli_error($con));
                                            $row3 = mysqli_fetch_array($query3);
                                            if (mysqli_num_rows($query3) > 0) {
                                                echo '  
                                            <a href="../user/product-shortages.php">                                               
                                            <i class="glyphicon glyphicon-minus-sign icon" style="color:#E1AD41;">                                                                                                                                               
                                            
                                            </i>
                                            <p> ' . $row3['prodcount'] . '  ITEMS NEED ATTENTION</p>
                                            </a>';
                                            }
                                            ?>


                                            <?php
                                            ?>
                                            <?php
                                            $query3 = mysqli_query($con, "SELECT count(temp_trans_id) AS prodcount FROM `draft_temp_trans` GROUP BY order_no") or die(mysqli_error($con));
                                            $row3 = mysqli_fetch_array($query3);
                                            if (mysqli_num_rows($query3) > 0) {
                                                echo '<a href="../user/draft-sale.php">';
                                                echo '<i class="glyphicon glyphicon-refresh icon"></i>';
                                                echo '<p>' . $row3['prodcount'] . ' PENDING DRAFT PAYMENTS</p>';
                                                echo '</a>';
                                            } else {
                                                
                                                echo '<a href="../user/draft-sale.php">';
                                                echo '<i class="glyphicon glyphicon-refresh icon"></i>';
                                                echo '<p>0 PENDING DRAFT PAYMENTS</p>';
                                                echo '</a>';
                                            }
                                            ?>

                                        </div>
                                        <div class="row menu ">
                                            <?php
                                            $query3 = mysqli_query($con, "SELECT COUNT(*) AS prodcount FROM `product` WHERE DATE(NOW()) > DATE(expire_date) ") or die(mysqli_error($con));
                                            $row3 = mysqli_fetch_array($query3);
                                            if (mysqli_num_rows($query3) > 0) {
                                                echo '  <a href="product.php" style="margin-left: -63%;">  
                                            <i class="glyphicon glyphicon-alert icon" style="color:crimson;" >                                                                                            
                                            </i>
                                            <p> ' . $row3['prodcount'] . '
                                            EXPIRED ITEMS </p>
                                            </a>';
                                            }
                                            ?>

                                        </div>
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

                    $(this).parents(".record").animate({
                            backgroundColor: "#fbc7c7"
                        }, "fast")
                        .animate({
                            opacity: "hide"
                        }, "slow");
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