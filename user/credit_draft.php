<?php
session_start();
if (empty($_SESSION['id'])) :
    header('Location:../index.php');
endif;
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Product | <?php include('../dist/includes/title.php'); ?></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
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
        include('../dist/includes/header.php');
        //include('../Objects/Objects.php');
        //$Objects = new InvObjects();
        ?>
        <!-- Full Width Column -->
        <div class="content-wrapper">
            <div class="container">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        <a class="btn btn-lg btn-warning" href="javascript:void(0);" onclick="window.history.back();">Back</a>
                        <a class="btn btn-lg btn-primary" href="credit_customer.php" style="color:#fff;" class="small-box-footer">New Credit Note <i class="glyphicon glyphicon-plus text-blue"></i></a>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Product</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title" style=" color: black"><b>credit List</b></h3>
                                </div>
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Customers Name</th>
                                                <th>credit Number</th>
                                                <th>credit Date</th>
                                                <th>Total</th>
                                                <th>Print Invoice</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php

                                            $query = mysqli_query($con, "SELECT credit_id, credit_note_number,Customer_id, customer_name, date, SUM(total) AS totals FROM credit_note  GROUP BY credit_note_number") or die(mysqli_error($con));

                                            while ($row = mysqli_fetch_array($query)) {
                                                $orderNo = $row['credit_note_number'];
                                                $customer_name = $row['customer_name'];
                                                $date2collect = date('d M, Y', strtotime($row['date']));
                                                $total = $row['totals'];
                                                $grand = 0;
                                                $grand += $total;

                                                // Output the results, including the total for each credit_note_number
                                            ?>
                                                <tr>
                                                    <td><?php echo $customer_name; ?></td>
                                                    <td><?php echo $orderNo; ?></td>
                                                    <td><?php echo $date2collect; ?></td>
                                                    <td><?php echo number_format($grand, 2); ?></td>
                                                    <td>
                                                        <a class="btn btn-success" style="color: black;" href="credit-note.php?id=<?php echo $row['Customer_id']; ?>&orderno=<?php echo $orderNo; ?>" style="color: #003eff "><b>Print credit note</b></a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success" style="color: black;" href="update_credit.php?orderno=<?php echo $orderNo; ?>&customer_name=<?php echo $customer_name; ?>&cust_id=<?php echo $row['Customer_id']; ?>"><b>Edit</b></a>
                                                        <a class="btn btn-success" style="color: black;" href="credit_num_delete.php?id=<?php echo $row['credit_note_number']; ?>" onclick="return confirm('Are you sure you want to delete this credit note?')">
                                                            <b>Delete</b>
                                                        </a>
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
            </div>
        </div>
        <?php include('../dist/includes/footer.php'); ?>
    </div>
    <div id="add" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="height:auto">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">Edit Credit Note</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" action="add_item_sales.php" enctype='multipart/form-data'>
                        <div class="form-group">
                            <label class="control-label col-lg-3" for="file">Items +Sold</label>
                            <div class="col-lg-9">
                                <select class="form-control select2" style="width: 100%;" name="item_sold_id" required>
                                    <?php
                                    $query2 = mysqli_query($con, "select * from product") or die(mysqli_error($con));
                                    while ($row2 = mysqli_fetch_array($query2)) {
                                    ?>
                                        <option value="<?php echo $row2['prod_id']; ?>"><?php echo $row2['prod_name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3" for="price">Quantity Sold</label>
                            <div class="col-lg-9">
                                <input type="number" class="form-control" id="price" name="quantity" placeholder="Quantity Sold" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3" for="price">Price Per Item</label>
                            <div class="col-lg-9">
                                <input type="number" class="form-control" id="price" name="price" placeholder="Price Sold Per Item" required>
                            </div>
                        </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Save changes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>

    <script src="../bootstrap/js/bootstrap.min.js"></script>

    <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>

    <script src="../plugins/fastclick/fastclick.min.js"></script>

    <script src="../dist/js/app.min.js"></script>

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
</body>

</html>