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
    <title>Group Members | <?php include('../dist/includes/title.php'); ?></title>
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

</head>
<?php
if (isset($_POST['remove'])) {
    $groupid = 0;
    $userid = $_POST['user_id'];

    $updated = $GroupObject->updateUserGroup($groupid, $userid);

    echo "<script>window.location = 'groups-manage'</script>";
}

?>


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
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-body">
                                    <table id="employee_data" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Username</th>
                                                <th>
                                                    Name
                                                </th>

                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <?php
                                            $GroupMembers = $GroupObject->getGroupMembers($_GET['group']);
                                            if (mysqli_num_rows($GroupMembers) == 0) {
                                                echo ' <center>
                                                    <h3 style="color: red" class="box-title"><b>This group is empty.</b></h3>
                                                    </center>';
                                            } else {


                                                while ($row = mysqli_fetch_array($GroupMembers)) {
                                                    $id = $row['user_id'];
                                            ?>
                                                    <tr>
                                                        <td><?php echo $row['name'];
                                                            ?>
                                                        </td>
                                                        <td>
                                                            <?php echo $row['username']; ?>
                                                        </td>
                                                        <td>
                                                            <form action="" method="post">
                                                                <input type="hidden" name="user_id" value="<?= $id ?>">
                                                                <input type="hidden" name="group_id" value="<?= $_GET['group'] ?>">
                                                                <button name="remove" class="btn btn-danger" style="background: #f56;" type="submit">Remove</button>
                                                            </form>
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
                                                                    <form method="post">
                                                                        <div class="box box-primary">

                                                                            <div class="box-body">

                                                                                <div class="form-group">
                                                                                    <h5 style="color: black"><b>Name</b></h5>
                                                                                    <input required="required" name="group_name" class="form-control" placeholder="Name:">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <h5>
                                                                                        Permissions
                                                                                    </h5>
                                                                                    <div class="row">
                                                                                        <div class="col-lg-6">
                                                                                            <div class="input-group">
                                                                                                <span class="input-group-addon">
                                                                                                    <input name="comp_setup" type="checkbox" aria-label="...">
                                                                                                </span>
                                                                                                <input type="text" class="form-control" aria-label="..." value="Company Setup" disabled>
                                                                                            </div><!-- /input-group -->
                                                                                            <div class="input-group">
                                                                                                <span class="input-group-addon">
                                                                                                    <input name="employee" type="checkbox" aria-label="...">
                                                                                                </span>
                                                                                                <input type="text" class="form-control" aria-label="..." value="Employee" disabled>
                                                                                            </div><!-- /input-group -->
                                                                                            <div class="input-group">
                                                                                                <span class="input-group-addon">
                                                                                                    <input name="hr_reports" type="checkbox" aria-label="...">
                                                                                                </span>
                                                                                                <input type="text" class="form-control" aria-label="..." value="HR Reports" disabled>
                                                                                            </div><!-- /input-group -->
                                                                                            <div class="input-group">
                                                                                                <span class="input-group-addon">
                                                                                                    <input name="payroll" type="checkbox" aria-label="...">
                                                                                                </span>
                                                                                                <input type="text" class="form-control" aria-label="..." value="Payroll" disabled>
                                                                                            </div><!-- /input-group -->
                                                                                            <div class="input-group">
                                                                                                <span class="input-group-addon">
                                                                                                    <input name="payroll_reports" type="checkbox" aria-label="...">
                                                                                                </span>
                                                                                                <input type="text" class="form-control" aria-label="..." value="Payroll Reports" disabled>
                                                                                            </div><!-- /input-group -->
                                                                                            <div class="input-group">
                                                                                                <span class="input-group-addon">
                                                                                                    <input name="settings" type="checkbox" aria-label="...">
                                                                                                </span>
                                                                                                <input type="text" class="form-control" aria-label="..." value="Settings" disabled>
                                                                                            </div><!-- /input-group -->
                                                                                            <div class="input-group">
                                                                                                <span class="input-group-addon">
                                                                                                    <input name="recruitment" type="checkbox" aria-label="...">
                                                                                                </span>
                                                                                                <input type="text" class="form-control" aria-label="..." value="Recruitment" disabled>
                                                                                            </div><!-- /input-group -->
                                                                                            <div class="input-group">
                                                                                                <span class="input-group-addon">
                                                                                                    <input name="users" type="checkbox" aria-label="...">
                                                                                                </span>
                                                                                                <input type="text" class="form-control" aria-label="..." value="Users" disabled>
                                                                                            </div><!-- /input-group -->
                                                                                        </div </div>
                                                                                    </div>


                                                                                </div>
                                                                                <div class="box-footer">
                                                                                    <div class="pull-right">
                                                                                        <button name="save_group" type="submit" class="btn btn-primary"></i>Save</button>
                                                                                    </div>
                                                                                    <button onclick="window.history.back();" class="btn btn-default"><i class="fa fa-times"></i> Discard</button>
                                                                                </div><!-- /.box-footer -->
                                                                            </div><!-- /. box -->

                                                                    </form>
                                                                </div>

                                                            </div>
                                                            <!--end of modal-dialog-->
                                                        </div>
                                                <?php }
                                            } ?>
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