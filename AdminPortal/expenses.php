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
                <div class="container-fluid">
                    <div class="header">
                        <i></i>
                        <h3>Expenses</h3>
                        <div class="form">
                            <form id="supplierForm" class="form-inline" method="post" action="add_expense.php" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="date">Expense Amount</label>
                                    <div class="input-group col-md-4">
                                        <input type="text" class="form-control" id="date" name="amount" placeholder="Amount" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <!-- <label> Payment Date</label>
                                    <input  type="date" name="date" readonly> -->

                                    <label> Payment method</label>
                                    <select class="form-control" type="select" name="pay">
                                        <option>--Select Payment--</option>
                                        <option>Credit card</option>
                                        <option>Debit card</option>
                                        <option>Cheque</option>
                                        <option>Cash</option>
                                    </select>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="date">Supplier</label>

                                    <select class="form-control" type="select" name="supplier">
                                        <option>--Select supplier--</option>
                                        <?php
                                        $query = mysqli_query($con, "SELECT DISTINCT supplier_id, supplier_name FROM supplier") or die(mysqli_error($con));
                                        while ($row = mysqli_fetch_assoc($query)) {
                                            $supplierId = $row['supplier_id'];
                                            $supplierName = $row['supplier_name'];
                                            echo "<option value='$supplierId'>$supplierName</option>";
                                        }
                                        ?>
                                    </select>

                                    <input type="hidden" value="$supplierId" name="supId"> </input>

                                </div>


                                <div class="form-group">
                                    <label for="date">Payment Account </label>
                                    <button type="button" name="" class="btn btn-primary" onclick="$('#addPaymentAccountModal').modal('show');"> + Add </button>
                                    <a href="./account_edit.php" class="btn btn-warning">Edit</a>

                                    <select class="form-control" type="select" name="pa" required>
                                        <?php
                                        $query = mysqli_query($con, "SELECT * FROM payment_account WHERE name IS NOT NULL AND name != '' ORDER BY name") or die(mysqli_error($con));
                                        while ($row = mysqli_fetch_assoc($query)) {
                                            $payName = $row['name'];
                                            $paId = $row['id'];
                                            echo "<option value='$paId'>$payName</option>";
                                        }
                                        ?>
                                    </select>

                                    <input type="hidden" id="selectedPaId " name="paId" value="">
                                    <input type="hidden" id="selectedPaName" name="paName" value="">

                                    <!-- <script>
                                        console.log(<?php echo $paId ?>)
                                    </script> -->

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

                                </div>

                                <div class="form-group">
                                    <label for="date">Category</label>
                                    <select class="form-control" type="select" name="category">
                                        <option>--Select Expense Type--</option>
                                        <?php
                                        $query = mysqli_query($con, "SELECT * FROM expense_types_tb ORDER by exp_name") or die(mysqli_error($con));
                                        while ($row = mysqli_fetch_assoc($query)) {
                                            $expName = $row['exp_name'];
                                            echo "<option>$expName</option>";
                                        }
                                        ?>
                                    </select>

                                </div>

                                <br>
                                <div class="form-group">
                                    <label for="date">Expense Description</label>
                                    <div class="input-group col-md-12">
                                        <textarea class="form-control pull-right" id="date" name="description" placeholder="Supplier Complete Address" required> </textarea>
                                    </div>
                                </div> <br>
                                <div class="form-group">
                                    <h5>Attachement</h5>
                                    <div class="drop-area" id="dropArea">
                                        <p>Drag and drop files here or click to select files</p>
                                        <input type="file" id="fileInput" name="file" style="display: none;" multiple>
                                    </div>
                                    <div id="fileList"></div>
                                </div>
                                <br>
                                <div class="form-group ">
                                    <button class="btn btn-primary" style="">Add Expense</button>
                                    <button class="btn btn-primary" style="" id="clearButton">Clear</button>
                                </div>

                            </form>

                            <script>
                                const form = document.getElementById("supplierForm");
                                const date = document.getElementById("date");
                                const file = document.getElementById("file");
                                const cat = document.getElementById("category");
                                const sup = document.getElementById("supplier");
                                const hiddenInput = document.getElementById("supId");
                                const clearButton = document.getElementById("clearButton");

                                clearButton.addEventListener("click", function() {
                                    form.reset(); 
                                    hiddenInput.value = ""; 
                                });
                            </script>
                        </div>
                    </div>
                    <div class="body">
                        <div class="table">
                            <table id="expense_table" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>DATE</th>
                                        <th>DESCRIPTION</th>
                                        <th>CATEGORY</th>
                                        <th>SUPPLIER</th>
                                        <th>PAYMENT ACCOUNT</th>
                                        <th>AMOUNT</th>
                                        <th>PAYMENT METHOD</th>
                                        <th>ATTACHMENT</th>
                                        <th>EDIT</th>
                                        <th>DELETE</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php
                                    $user_query = mysqli_query($con, "select * from expenses_tb") or die(mysqli_error($con));
                                    while ($row = mysqli_fetch_array($user_query)) {
                                        $id = $row['id'];

                                        $CV = "../Objects/" . $row['attachment'];
                                    }
                                    ?>

                                    <?php
                                    $query = mysqli_query($con, "SELECT supplier.supplier_id, supplier.supplier_name, expenses_tb.* FROM expenses_tb INNER JOIN supplier ON supplier.supplier_id = expenses_tb.supplier_id") or die(mysqli_error($con));
                                    while ($row = mysqli_fetch_array($query)) {
                                    ?>
                                        <tr>
                                            <td><?php echo $row['date']; ?></td>
                                            <td><?php echo $row['description']; ?></td>
                                            <td><?php echo $row['category']; ?></td>
                                            <td><?php echo $row['supplier_name']; ?></td>
                                            <td><?php echo $row['payment_acc_name']; ?></td>
                                            <td><?php echo $row['amount']; ?></td>
                                            <td><?php echo $row['payment_method']; ?></td>
                                            <td><a rel="tooltip" target="_blank" type="application/octet-stream" download="<?php echo $CV; ?>" title="Download CV" href="<?php echo $CV; ?>" "  class=" small-box-footer"><i class="glyphicon glyphicon-download"></i></a></td>


                                            <td>
                                                <a href="#updateordinance<?php echo $row['id']; ?>" data-toggle="modal" class="small-box-footer"><i class="glyphicon glyphicon-edit text-blue"></i></a>
                                            </td>
                                            <td>
                                                <a href="#delete<?php echo $row['id']; ?>" data-toggle="modal" class="small-box-footer"><i class="glyphicon glyphicon-trash text-blue"></i></a>
                                            </td>
                                            <?php include './modals.php' ?>

                                        </tr> <?php  } ?>
                                </tbody>
                            </table>
                        </div>

                    </div>


                </div>

            </div>

        </div>
        <?php include('../dist/includes/footer.php'); ?>
    </div>
    <script src="../plugins/select2/select2.full.min.js"></script>
    
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
    
    <script src="../plugins/fastclick/fastclick.min.js"></script>
    
    <script src="../dist/js/app.min.js"></script>
   
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

    <script>
        const dropArea = document.getElementById('dropArea');
        const fileInput = document.getElementById('fileInput');
        const fileList = document.getElementById('fileList');

        dropArea.addEventListener('dragover', (e) => {
            e.preventDefault();
            dropArea.classList.add('highlight');
        });

        dropArea.addEventListener('dragleave', () => {
            dropArea.classList.remove('highlight');
        });

        dropArea.addEventListener('drop', (e) => {
            e.preventDefault();
            dropArea.classList.remove('highlight');

            const files = e.dataTransfer.files;
            handleFiles(files);
        });

        dropArea.addEventListener('click', () => {
            fileInput.click();
        });

        fileInput.addEventListener('change', () => {
            const files = fileInput.files;
            handleFiles(files);
        });

        function handleFiles(files) {
            fileList.innerHTML = ''; 

            for (const file of files) {
                const fileItem = document.createElement('p');
                fileItem.textContent = file.name;
                fileList.appendChild(fileItem);
            }
        }
    </script>

    <script>
        $(document).ready(function() {
            $('#paymentAccountSelect').on('change', function() {
                var selectedOption = $(this).find('option:selected');
                var selectedValue = selectedOption.val();
                if (selectedValue !== '') {
                    $('#addPaymentAccountModal').modal('show');
                }
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
document.querySelector('select[name="pa"]').addEventListener('change', function() {
    var selectedOption = this.options[this.selectedIndex];
    document.getElementById('selectedPaId').value = selectedOption.value;
    document.getElementById('selectedPaName').value = selectedOption.text;
});

</script>



</body>


</html>