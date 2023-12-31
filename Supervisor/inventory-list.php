<?php
session_start();
if (empty($_SESSION['id'])):
    header('Location:../index.php');
endif;
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Inventory List | <?php include('../dist/includes/title.php'); ?></title>
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
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            <a class="btn btn-lg btn-warning" href="add-inventory.php">Add Inventory</a>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Inventory</li>
                        </ol>
                    </section>

                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Inventory List</h3>
                                    </div><!-- /.box-header -->
                                    <div class="box-body">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>                                                   
                                                    <th>Item Name</th>
                                                    <th>Quantity In Stock</th>
                                                    <th># Damages / Losses</th>
                                                    <th>Date Added</th>
                                                    <th>Added By</th>                                                    
                                                    <th>Edit Inventory</th>
                                                    <th>Record Damages</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $branch = $_SESSION['branch'];
                                                $query = mysqli_query($con, "select id, inventory_tb.name AS invname,quantity,date_added,user.name AS user from inventory_tb "
                                                        . " INNER JOIN user ON user.user_id = inventory_tb.added_by ")or die(mysqli_error($con));
                                                $i = 1;
                                                while ($row = mysqli_fetch_array($query)) {
                                                    $cid = $row['id'];
                                                    ?>
                                                    <tr>                                                   
                                                        <td><?php echo $row['invname']; ?></td>
                                                        <td><?php echo $row['quantity']; ?></td>
                                                        <td><?php
                                                            $query2 = mysqli_query($con, "SELECT quantity FROM inv_damages_tb WHERE inv_id ='$cid'")or die(mysqli_error($con));
                                                            $row1 = mysqli_fetch_array($query2);
                                                            if (mysqli_num_rows($query2) > 0) {
                                                                echo "<span class='label label-danger'>" . $row1['quantity'] . "</span>";
                                                            } else {
                                                                echo "<span class='label label-success'>No Damages</span>";
                                                            }
                                                            ?></td>
                                                        <td><?php echo $row['date_added']; ?></td>
                                                        <td><?php echo $row['user']; ?></td>                                                   
                                                        <td>                                                            
                                                            <a href="#updateordinance<?php echo $row['id']; ?>" data-target="#updateordinance<?php echo $row['id']; ?>" data-toggle="modal" style="color:#fff;" class="small-box-footer"><i class="glyphicon glyphicon-edit text-blue"></i></a>
                                                        </td>
                                                        <td>                                                            
                                                            <a href="#updatedamages<?php echo $row['id']; ?>" data-target="#updatedamages<?php echo $row['id']; ?>" data-toggle="modal" style="color:#fff;" class="small-box-footer"><i class="glyphicon glyphicon-edit text-blue"></i></a>
                                                        </td>
                                                        <td>
                                                            <a href="#delete<?php echo $row['id']; ?>" data-target="#delete<?php echo $row['id']; ?>" data-toggle="modal" style="color:#fff;" class="small-box-footer"><i class="glyphicon glyphicon-trash text-blue"></i></a>
                                                        </td>
                                                    </tr>
                                                <div id="updateordinance<?php echo $row['id']; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="height:auto">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title">Update Inventory Details</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form class="form-horizontal" method="post" action="update_inventory.php" enctype='multipart/form-data'>

                                                                    <div class="form-group" hidden="">
                                                                        <label class="control-label col-lg-3" for="name">Last Name</label>
                                                                        <div class="col-lg-9">
                                                                            <input type="hidden" class="form-control" id="id" name="id" value="<?php echo $row['id']; ?>" required>  

                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-lg-3" for="name">Item</label>
                                                                        <div class="col-lg-9">
                                                                            <input type="text" class="form-control" id="name" name="invname" value="<?php echo $row['invname']; ?>" required>  
                                                                        </div>
                                                                    </div>				
                                                                    <div class="form-group">
                                                                        <label class="control-label col-lg-3" for="file">Quantity</label>
                                                                        <div class="col-lg-9">
                                                                            <input class="form-control" id="name" name="quantity" required type="number" value="<?php echo $row['quantity']; ?>" >  
                                                                        </div>
                                                                    </div> 

                                                            </div><br><br><br><hr>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            </div>
                                                            </form>
                                                        </div>

                                                    </div><!--end of modal-dialog-->
                                                </div>

                                                <div id="delete<?php echo $row['id']; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="height:auto">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title">Are u sure you want to delete this??                                                                    
                                                                </h4>
                                                            </div>
                                                            <div class="modal-body" hidden="">
                                                                <form class="form-horizontal" method="post" action="delete-inventory-list.php" enctype='multipart/form-data'>
                                                                    <div class="form-group" hidden="hidden">
                                                                        <label class="control-label col-lg-3" for="price">Serial #</label>
                                                                        <div class="col-lg-9">
                                                                            <input type="text" class="form-control" id="price" name="id" value="<?php echo $row['id']; ?>" required>  
                                                                        </div>
                                                                    </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Delete</button>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                            </div>
                                                            </form>
                                                        </div>
                                                    </div><!--end of modal-dialog-->
                                                </div>


                                                <div id="updatedamages<?php echo $row['id']; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="height:auto">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title">Record <?php
                                                                    echo $row['invname'];
                                                                    ?>
                                                                    Damages / Losses</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form class="form-horizontal" method="post" action="record-inv-damages.php" enctype='multipart/form-data'>
                                                                    <div class="form-group" hidden="">
                                                                        <label class="control-label col-lg-3" for="name">Last Name</label>
                                                                        <div class="col-lg-9">
                                                                            <input type="hidden" class="form-control" id="id" name="id" value="<?php echo $row['id']; ?>" required>  

                                                                        </div>
                                                                    </div>                                                                   				
                                                                    <div class="form-group">
                                                                        <label class="control-label col-lg-3" for="file">No Damages</label>
                                                                        <div class="col-lg-9">
                                                                            <input class="form-control" id="name" name="quantity" required type="number" >  
                                                                        </div>
                                                                    </div> 

                                                            </div><br><br><br><hr>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            </div>
                                                            </form>
                                                        </div>

                                                    </div><!--end of modal-dialog-->
                                                </div>
                                                <!--end of modal-->   	  

                                                <?php
                                                $i++;
                                            }
                                            ?>					  
                                            </tbody>

                                        </table>
                                    </div><!-- /.box-body -->

                                </div><!-- /.col -->


                            </div><!-- /.row -->


                    </section><!-- /.content -->
                </div><!-- /.container -->
            </div><!-- /.content-wrapper -->
            <?php include('../dist/includes/footer.php'); ?>
        </div><!-- ./wrapper -->

        <!-- jQuery 2.1.4 -->
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
                $("#example1").DataTable();
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false,
                    buttons: [
                        'copy', 'csv', 'excel', 'pdf', 'print'
                    ]
                });

            });
        </script>
        <script>
            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();

                //Datemask dd/mm/yyyy
                $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
                //Datemask2 mm/dd/yyyy
                $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
                //Money Euro
                $("[data-mask]").inputmask();

                //Date range picker
                $('#reservation').daterangepicker();
                //Date range picker with time picker
                $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
                //Date range as a button
                $('#daterange-btn').daterangepicker(
                        {
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
