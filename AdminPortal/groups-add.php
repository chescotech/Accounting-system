<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
include('../dist/includes/dbcon.php');
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Add Groups | <?php include('../dist/includes/title.php'); ?></title>
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

<?php
include_once 'Classes/Group.php';
$GroupObject = new Group($con);
?>

<?php
if (isset($_POST['save_group'])) {
    // return var_dump($_POST);
    $stateMessage = "";
    $group_name = $_POST['group_name'];
    $setup = isset($_POST['setup']) ? "true" : "false";
    $expenses = isset($_POST['expenses']) ? "true" : "false";
    $reports = isset($_POST['reports']) ? "true" : "false";
    $stock = isset($_POST['stock']) ? "true" : "false";
    $cash_flow = isset($_POST['cash_flow']) ? "true" : "false";
    $customer = isset($_POST['customer']) ? "true" : "false";
    $accounts = isset($_POST['accounts']) ? "true" : "false";
    $users = isset($_POST['users']) ? "true" : "false";
    $groups = isset($_POST['groups']) ? "true" : "false";

    $query_result = $GroupObject->createGroup($group_name, $setup, $expenses, $reports, $stock, $cash_flow, $customer, $accounts, $users, $groups);


    if ($query_result) {
        $stateMessage = "Group created successfully. You may now add users to this group.";
    } else {
        $stateMessage = "Group creation failed. Please try again.";
    }
    // return var_dump($stateMessage);
    echo "<script>window.location = 'groups-manage'</script>";
?>
<?php
}
?>

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav">
    <div class="wrapper">
        <?php
        include('../dist/includes/header_admin.php');
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

                        <div id="box" class="col-md-5" style=" width: 100%;">
                            <form method="post">
                                <div class="box box-success">
                                    <div class="box-header with-border">
                                        <?php
                                        if (isset($_POST['save_post']) && $stateMessage == "Group created successfully. You may now add users to this group.") {
                                            echo ' <center>
                                        <h3 style="color: green" class="box-title"><b>' . $stateMessage . '</b></h3>
                                        </center>';
                                        } else if (isset($_POST['save_post']) && $stateMessage != "Group creation failed. Please try again.") {
                                            echo ' <center>
                                        <h3 style="color: red" class="box-title"><b>' . $stateMessage . '</b></h3>
                                        </center>';
                                        } else {
                                            echo ' <center>
                                            <h3 style="color: black" class="box-title"><b>Create New Group</b></h3>
                                        </center>';
                                        }
                                        ?>
                                    </div><!-- /.box-header -->
                                    <div class="box-body">

                                        <div class="form-group">
                                            <h5 style="color: black"><b>Name</b></h5>
                                            <input required="required" name="group_name" class="form-control" placeholder="Name:">
                                        </div>
                                        <div class="form-group">
                                            <h3>
                                                Permissions
                                            </h3>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input name="setup" type="checkbox" aria-label="...">
                                                        </span>
                                                        <input type="text" class="form-control" aria-label="..." value="Setup" disabled>
                                                    </div><!-- /input-group -->
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input name="expenses" type="checkbox" aria-label="...">
                                                        </span>
                                                        <input type="text" class="form-control" aria-label="..." value="Expenses" disabled>
                                                    </div><!-- /input-group -->
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input name="customer" type="checkbox" aria-label="...">
                                                        </span>
                                                        <input type="text" class="form-control" aria-label="..." value="Customer" disabled>
                                                    </div><!-- /input-group -->
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input name="stock" type="checkbox" aria-label="...">
                                                        </span>
                                                        <input type="text" class="form-control" aria-label="..." value="Stock" disabled>
                                                    </div><!-- /input-group -->
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input name="users" type="checkbox" aria-label="...">
                                                        </span>
                                                        <input type="text" class="form-control" aria-label="..." value="Users" disabled>
                                                    </div><!-- /input-group -->
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input name="groups" type="checkbox" aria-label="...">
                                                        </span>
                                                        <input type="text" class="form-control" aria-label="..." value="Group" disabled>
                                                    </div><!-- /input-group -->
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input name="cash_flow" type="checkbox" aria-label="...">
                                                        </span>
                                                        <input type="text" class="form-control" aria-label="..." value="Cash Flow" disabled>
                                                    </div><!-- /input-group -->
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input name="accounts" type="checkbox" aria-label="...">
                                                        </span>
                                                        <input type="text" class="form-control" aria-label="..." value="Accounts" disabled>
                                                    </div><!-- /input-group -->
                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <input name="reports" type="checkbox" aria-label="...">
                                                        </span>
                                                        <input type="text" class="form-control" aria-label="..." value="Reports" disabled>
                                                    </div><!-- /input-group -->
                                                </div </div>
                                            </div>


                                        </div>
                                        <div class="box-footer">
                                            <div class="pull-right">
                                                <button name="save_group" type="submit" class="btn btn-success"></i>Save</button>
                                            </div>
                                            <button onclick="window.history.back();" class="btn btn-default"><i class="fa fa-times"></i> Discard</button>
                                        </div><!-- /.box-footer -->
                                    </div><!-- /. box -->

                            </form>

                        </div><!-- /.col -->
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
    <script>
        const selectElement = document.querySelector("select[name='pa']");
        const paIdInput = document.getElementById("selectedPaId");
        const paNameInput = document.getElementById("selectedPaName");

        selectElement.addEventListener("change", function() {
            const selectedOption = selectElement.options[selectElement.selectedIndex];
            paIdInput.value = selectedOption.value;
            paNameInput.value = selectedOption.textContent;
        });
    </script>

    <script>
        // Example JavaScript code (update based on your actual requirements)
        document.querySelector('select[name="pa"]').addEventListener('change', function() {
            var selectedOption = this.options[this.selectedIndex];
            document.getElementById('selectedPaId').value = selectedOption.value;
            document.getElementById('selectedPaName').value = selectedOption.text;
        });
    </script>



</body>


</html>