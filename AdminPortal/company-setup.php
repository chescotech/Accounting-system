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

        <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="../plugins/select2/select2.min.css">
        <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.css" />
        <script type="text/javascript" src="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.css" />
        <script type="text/javascript" src="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.js"></script>

        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="../plugins/datatables/table-exporter.js"></script>
        <style>
        </style>
    </head>
    <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

    <body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav">
        <div class="wrapper">
            <?php
            include('../dist/includes/header_admin.php');
            include('../dist/includes/dbcon.php');
            ?>

            <div class="content-wrapper">
                <div class="container">
                    <section class="content-header">
                        <h1>
                          <a class="btn btn-lg btn-warning" href="javascript:void(0)" onclick="window.history.back()">Back</a>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Company Setup</li>
                        </ol>
                    </section>

                    <section class="content">
                        <div class="row">
                            <div class="col-xs-15">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Company Setup</h3>
                                    </div><!-- /.box-header -->
                                    <div class="box-body">
                                        <button id="btnExport" onclick="javascript:xport.toCSV('example1');"> Export to CSV</button>
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Logo</th>
                                                    <th>Branch Name</th>
                                                    <th>Branch Address</th>
                                                    <th>Contact #</th>
                                                    <th>Receipt Footer</th>
                                                    <th>Notification Count Setting</th>

                                                    <th>Bank Account Name</th>
                                                    <th>Bank Name</th>
                                                    <th>Account Number</th>
                                                    <th>Sort Code</th>
                                                    <th>Branch Code</th>
                                                    <th>Action</th>
                                                </tr>

                                            </thead>

                                            <tbody>
                                                <?php
                                                $query = mysqli_query($con, "select * from branch") or die(mysqli_error($con));
                                                while ($row = mysqli_fetch_array($query)) {
                                                    ?>
                                                    <tr>
                                                        <td><img style="width:80px;height:60px" src="../dist/uploads/comp/<?php echo $row['logo']; ?>"></td>
                                                        <td><?php echo $row['branch_name']; ?></td>
                                                        <td><?php echo $row['branch_address']; ?></td>
                                                        <td><?php echo $row['branch_contact']; ?></td>
                                                        <td><?php echo $row['reciept_footer_text']; ?></td>
                                                        <td><?php echo $row['notification_count']; ?></td>

                                                        <td><?php echo $row['bank_account_name']; ?></td>
                                                        <td><?php echo $row['bank']; ?></td>
                                                        <td><?php echo $row['account_number']; ?></td>
                                                        <td><?php echo $row['sort_code']; ?></td>
                                                        <td><?php echo $row['branch_code']; ?></td>
                                                        <td>
                                                            <a href="#updateordinance<?php echo $row['branch_id']; ?>" data-target="#updateordinance<?php echo $row['branch_id']; ?>" data-toggle="modal" style="color:#fff;" class="small-box-footer"><i class="glyphicon glyphicon-edit text-blue"></i></a>
                                                        </td>
                                                    </tr>
                                                <div id="updateordinance<?php echo $row['branch_id']; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="height:auto">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title">Update Company Details</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form class="form-horizontal" method="post" action="update-company-details.php" enctype='multipart/form-data'>
                                                                    <div class="form-group">
                                                                        <label for="name">Company Name</label>
                                                                        <div class="input-group col-md-12"><input type="hidden" class="form-control" id="id" name="id" value="<?php echo $row['supplier_id']; ?>" required>
                                                                            <input type="text" class="form-control" id="name" name="branch_name" value="<?php echo $row['branch_name']; ?>" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="date">Address</label>
                                                                        <div class="input-group col-md-12">
                                                                            <textarea class="form-control pull-right" id="date" name="address" placeholder="Supplier Complete Address" required><?php echo $row['branch_address']; ?></textarea>
                                                                        </div><!-- /.input group -->
                                                                    </div><!-- /.form group -->
                                                                    <div class="form-group">
                                                                        <label for="date">Contact #</label>
                                                                        <div class="input-group col-md-12">
                                                                            <input type="text" class="form-control pull-right" id="date" name="contact" placeholder="Contact # of Supplier" value="<?php echo $row['branch_contact']; ?>" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="date">Receipt Footer Text</label>
                                                                        <div class="input-group col-md-12">
                                                                            <input type="text" class="form-control pull-right" id="date" name="reciept_footer_text" placeholder="Receipt Footer Text" value="<?php echo $row['reciept_footer_text']; ?>" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="date">Notification Count Setting</label>
                                                                        <div class="input-group col-md-12">
                                                                            <input type="number" class="form-control pull-right" id="date" name="notification_count" placeholder="Receipt Footer Text" value="<?php echo $row['notification_count']; ?>" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="date">Logo</label>
                                                                        <div class="input-group col-md-12">
                                                                            <input type="file" name="fileToUpload" id="fileToUpload">
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="date">Bank Account Name</label>
                                                                        <div class="input-group col-md-12">
                                                                            <input type="text" class="form-control pull-right" id="date" name="bank_account_name" placeholder="Bank Account Name" value="<?php echo $row['branch_name']; ?>" required>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="date">Bank Name</label>
                                                                        <div class="input-group col-md-12">
                                                                            <input type="text" class="form-control pull-right" id="date" name="bank" placeholder="Bank Name E.g Barclays Bank" value="<?php echo $row['bank']; ?>" required>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="date">Account Number</label>
                                                                        <div class="input-group col-md-12">
                                                                            <input type="text" class="form-control pull-right" id="date" name="account_number" placeholder="Account Number" value="<?php echo $row['account_number']; ?>" required>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="date">Sort Code</label>
                                                                        <div class="input-group col-md-12">
                                                                            <input type="text" class="form-control pull-right" id="date" name="sort_code" placeholder="Sort Code" value="<?php echo $row['sort_code']; ?>" required>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="date">Branch Code</label>
                                                                        <div class="input-group col-md-12">
                                                                            <input type="text" class="form-control pull-right" id="date" name="branch_code" placeholder="Branch Code" value="<?php echo $row['branch_code']; ?>" required>
                                                                        </div>
                                                                    </div>

                                                            </div>
                                                            <hr>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Update Details</button>
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
                                    </div>
                                </div><!-- /.col -->
                            </div><!-- /.row -->

                    </section><!-- /.content -->
                </div><!-- /.container -->
            </div><!-- /.content-wrapper -->
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

        <script>
                                            $(function () {

                                                $('#example1').DataTable({
                                                    dom: 'Bfrtip',
                                                    "paging": true,
                                                    "bSort": true,
                                                    buttons: [
                                                        'csv', 'excel', 'print', 'pdf'
                                                    ]
                                                });
                                            });
        </script>
        <script>
            $(function () {
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
                        function (start, end) {
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