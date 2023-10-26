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
    <title>Groups | <?php include('../dist/includes/title.php'); ?></title>
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
        include_once './Classes/Group.php';
        $GroupObject = new Group($con);
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
                        <li class="active">View Groups</li>
                    </ol>
                </section>
                <div class="container-fluid" style="margin-top: 8px;">
                    <div class="row">
                        <div class="col-md-4">
                            <form action="groups-add">
                                <table cellpadding="" border="0" class="se">
                                    <tr>
                                        <td>
                                            <button type="submit" name="save" id="save" type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Create Group</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <br></br>
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body">
                                    <table id="employee_data" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Members</th>
                                                <th>Members List</th>
                                                <!-- <th>Email</th>
                                            <th> Status</th>
                                            <th>Group</th> -->
                                                <th>Groups</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            $Groups = $GroupObject->getGroups();
                                            while ($row = mysqli_fetch_array($Groups)) {
                                                $id = $row['id'];
                                                $grp_name = $row['name'];
                                            ?>
                                                <tr>
                                                    <td><?php echo $grp_name;
                                                        ?></td>
                                                    <td>
                                                        <?php
                                                        $memberCount = $GroupObject->getGroupMemberCount($id);
                                                        echo $memberCount;
                                                        ?>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-default" href="group-members?group=<?= $id ?>">View Members</a>
                                                    </td>
                                                    <td>
                                                        <a href="#updateordinance<?php echo $id; ?>" data-target="#updateordinance<?php echo $id; ?>" data-toggle="modal" style="color:#fff;" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-pencil"></span> Manage Permissions</i></a>
                                                        <a href="#deleteordinance<?php echo $id; ?>" data-target="#deleteordinance<?php echo $id; ?>" data-toggle="modal" style="color:#000; background: #f01" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Delete</i></a>

                                                    </td>

                                                </tr>
                                                <div id="updateordinance<?php echo $id ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="height:auto">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title">Update Group Permissions </h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <?php
                                                                $permissions = $GroupObject->getGroupPermissions($id);

                                                                $perm_row = mysqli_fetch_array($permissions);
                                                                //  setup	expenses	reports	customers	accounts	stock	groups	users
                                                                $setup_perm = $perm_row['setup'];
                                                                $expenses_perm = $perm_row['expenses'];
                                                                $reports_perm = $perm_row['reports'];
                                                                $customer_perm = $perm_row['customer'];
                                                                $accounts_perm = $perm_row['accounts'];
                                                                $cash_flow_perm = $perm_row['cash_flow'];
                                                                $stock_perm = $perm_row['stock'];
                                                                $users_perm = $perm_row['users'];
                                                                $groups_perm = $perm_row['groups'];
                                                                ?>
                                                                <form method="post">
                                                                    <div class="box box-primary">

                                                                        <div class="box-body">

                                                                            <div class="form-group">
                                                                                <h5 style="color: black"><b>Name</b></h5>
                                                                                <input required name="group_name" class="form-control" placeholder="Name:" value="<?= $grp_name ?>">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <h5>
                                                                                    Permissions
                                                                                </h5>
                                                                                <div class="row">
                                                                                    <div class="col-lg-6">
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">
                                                                                                <input name="setup" type="checkbox" aria-label="..." <?php echo $setup_perm == 'true' ? "checked" : '' ?>>
                                                                                            </span>
                                                                                            <input type="text" class="form-control" aria-label="..." value="Setup" disabled>
                                                                                        </div><!-- /input-group -->
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">
                                                                                                <input name="expenses" type="checkbox" aria-label="..." <?php echo $expenses_perm == 'true' ? "checked" : '' ?>>
                                                                                            </span>
                                                                                            <input type="text" class="form-control" aria-label="..." value="Expenses" disabled>
                                                                                        </div><!-- /input-group -->
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">
                                                                                                <input name="reports" type="checkbox" aria-label="..." <?php echo $reports_perm == 'true' ? "checked" : '' ?>>
                                                                                            </span>
                                                                                            <input type="text" class="form-control" aria-label="..." value="Reports" disabled>
                                                                                        </div><!-- /input-group -->
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">
                                                                                                <input name="customer" type="checkbox" aria-label="..." <?php echo $customer_perm == 'true' ? "checked" : '' ?>>
                                                                                            </span>
                                                                                            <input type="text" class="form-control" aria-label="..." value="Customer" disabled>
                                                                                        </div><!-- /input-group -->
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">
                                                                                                <input name="stock_reports" type="checkbox" aria-label="..." <?php echo $stock_perm == 'true' ? "checked" : '' ?>>
                                                                                            </span>
                                                                                            <input type="text" class="form-control" aria-label="..." value="Stock" disabled>
                                                                                        </div><!-- /input-group -->
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">
                                                                                                <input name="cash_flow" type="checkbox" aria-label="..." <?php echo $cash_flow_perm == 'true' ? "checked" : '' ?>>
                                                                                            </span>
                                                                                            <input type="text" class="form-control" aria-label="..." value="Cash Flow" disabled>
                                                                                        </div><!-- /input-group -->
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">
                                                                                                <input name="accounts" type="checkbox" aria-label="..." <?php echo $accounts_perm == 'true' ? "checked" : '' ?>>
                                                                                            </span>
                                                                                            <input type="text" class="form-control" aria-label="..." value="Accounts" disabled>
                                                                                        </div><!-- /input-group -->
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">
                                                                                                <input name="users" type="checkbox" aria-label="..." <?php echo $users_perm == 'true' ? "checked" : '' ?>>
                                                                                            </span>
                                                                                            <input type="text" class="form-control" aria-label="..." value="Users" disabled>
                                                                                        </div><!-- /input-group -->
                                                                                        <div class="input-group">
                                                                                            <span class="input-group-addon">
                                                                                                <input name="groups" type="checkbox" aria-label="..." <?php echo $groups_perm == 'true' ? "checked" : '' ?>>
                                                                                            </span>
                                                                                            <input type="text" class="form-control" aria-label="..." value="Groups" disabled>
                                                                                        </div><!-- /input-group -->
                                                                                        <input type="hidden" name="group_id" value="<?= $id ?>">
                                                                                    </div>
                                                                                </div>
                                                                            </div>


                                                                        </div>
                                                                        <div class="box-footer">
                                                                            <div class="pull-right">
                                                                                <button name="update_group" type="submit" class="btn btn-primary"></i>Save</button>
                                                                            </div>
                                                                            <button data-dismiss="modal" class="btn btn-default"><i class="fa fa-times"></i> Discard</button>
                                                                        </div><!-- /.box-footer -->
                                                                    </div><!-- /. box -->

                                                                </form>
                                                            </div>

                                                        </div>
                                                        <!--end of modal-dialog-->

                                                    </div>
                                                </div>
                                                <!-- delete confirmation modal -->
                                                <div id="deleteordinance<?php echo $id ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="height:auto">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title">Delete Group Confirmation </h4>
                                                            </div>
                                                            <div class="modal-body">

                                                                <form method="post">
                                                                    <div class="box box-primary">

                                                                        <div class="box-body">

                                                                            <p>
                                                                                Are you sure you want to delete this group?
                                                                            </p>

                                                                            <input type="hidden" name="group_id" value="<?= $id ?>">
                                                                        </div>
                                                                        <div class="box-footer">
                                                                            <div class="pull-right">
                                                                                <button name="delete_group" type="submit" class="btn btn-danger" style="background: #f01;"></i>Delete</button>
                                                                            </div>
                                                                            <button data-dismiss="modal" class="btn btn-default"><i class="fa fa-times"></i>Cancel</button>
                                                                        </div><!-- /.box-footer -->
                                                                    </div><!-- /. box -->

                                                                </form>
                                                            </div>

                                                        </div>
                                                        <!--end of modal-dialog-->

                                                    </div>
                                                </div>
                                            <?php } ?>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div>

            </div>

        </div><!-- /.content-wrapper -->
        <?php include('../dist/includes/footer.php'); ?>
    </div>
    <?php
    if (isset($_POST['update_group'])) {
        $group_id = $_POST['group_id'];
        $group_name = $_POST['group_name'];
        $setup = $_POST['setup'] ? "true" : "false";
        $expenses = $_POST['expenses'] ? "true" : "false";
        $reports = $_POST['reports'] ? "true" : "false";
        $stock = $_POST['stock'] ? "true" : "false";
        $cash_flow = $_POST['cash_flow'] ? "true" : "false";
        $customer = $_POST['customer'] ? "true" : "false";
        $accounts = $_POST['accounts'] ? "true" : "false";
        $users = $_POST['users'] ? "true" : "false";
        $groups = $_POST['groups'] ? "true" : "false";

        $query_result = $GroupObject->updateGroup($group_id, $setup, $expenses, $reports, $stock, $cash_flow, $customer, $accounts, $users, $groups);


        echo '<script>
        window.location.assign("groups-manage")
    </script>';
    }
    ?>
    <?php
    if (isset($_POST['delete_group'])) {
        // return var_dump($_POST);
        $group_id = $_POST['group_id'];

        $query_result = $GroupObject->deleteGroup($group_id);

        echo "<script>window.location = 'groups-manage'</script>";
    }
    ?>
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

    <?php if (isset($errorMessage)) : ?>
        <script>
            alert('<?php echo $errorMessage; ?>');
        </script>
    <?php elseif (isset($successMessage)) : ?>
        <script>
            alert('<?php echo $successMessage; ?>');
        </script>
    <?php endif; ?>



</body>


</html>