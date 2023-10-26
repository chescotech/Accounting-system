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
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <style>
    </style>
</head>
<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav">
    <div class="wrapper">
        <?php
        include('../dist/includes/header.php');
        ?>     
        <div class="content-wrapper">
            <div class="container">        
                <section class="content-header">
                    <h1>
                        <a class="btn btn-lg btn-warning" href="javascript:void(0);" onclick="window.history.back();">Back</a>
                        <a class="btn btn-lg btn-primary" href="select_customer2.php" style="color:#fff;" class="small-box-footer">New Sale <i class="glyphicon glyphicon-plus text-blue"></i></a>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Product</li>
                    </ol>
                </section>              
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title" style=" color: black"><b>Sales Receipt List</b></h3>
                                </div>
                                <div class="box-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Customers Name</th>
                                                <th>Receipt Number</th>
                                                <th>Description</th>
                                                <th>Receipt Date</th>
                                                <th>Total</th>
                                                <th>Print Receipt</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $query = mysqli_query($con, "SELECT sales_details.description,sales.sales_id, customer_id, invoice_no, customer.cust_id, customer.cust_first, date_added, total as total_amount FROM sales INNER JOIN customer ON customer.cust_id = sales.customer_id JOIN sales_details ON sales_details.sales_id = sales.sales_id GROUP BY invoice_no") or die(mysqli_error($con));

                                            while ($row = mysqli_fetch_array($query)) {
                                                $orderNo = $row['invoice_no'];
                                                $customer_name = $row['cust_first'];
                                                $description = $row['description'];                                               
                                                $date2collect = date('d M, Y', strtotime($row['date_added']));

                                            ?>
                                                <tr>
                                                    <td><?php echo $customer_name; ?></td>
                                                    <td><?php echo $orderNo; ?></td>
                                                    <td><?php echo $description; ?></td>
                                                    <td><?php echo $date2collect; ?></td>
                                                    <td><?php echo number_format($row['total_amount'], 2); ?></td>
                                                    <td>
                                                        <a class="btn btn-success" style ="color:black;"  href="new_reciept.php?order_no=<?php echo $orderNo; ?>&id=<?php echo $row['sales_id']; ?>" style="color: #003eff "><b>Print receipt</b></a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success" style ="color:black;"  href="update-receipt.php?orderno=<?php echo $row['invoice_no']; ?>&customer_name=<?php echo $customer_name; ?>&cust_id=<?php echo $row['cust_id']; ?>" style="color: #003eff "><b>View / Update Receipt</b></i></a>                                                        
                                                    </td>
                                                    <td>                                                       
                                                        <a class="btn btn-danger" style="color: black;" href="sales_num_delete.php?id=<?php echo $row['sales_id']; ?>" onclick="return confirm('Are you sure you want to delete this sales Receipt?')">
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