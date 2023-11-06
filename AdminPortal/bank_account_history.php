<?php session_start();
error_reporting(E_ALL);

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Supplier | <?php include('../dist/includes/title.php'); ?></title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../plugins/select2/select2.min.css">
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css"> -->

    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <style>
        #selecedRowsList {
            display: none !important;
        }

        form .left .form-group {
            margin-right: 1rem !important;
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

        table th, td {
        margin:1.5rem;
        padding:1%;
        text-align: center;
        }
    </style>


    <script>
        window.onload = function() {
            // Get the message from the URL parameter
            var urlParams = new URLSearchParams(window.location.search);
            var message = urlParams.get("message");

            // Display the message in an alert
            if (message) {
                alert(message);
            }
        };
    </script>


</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav">
    <div class="wrapper">
        <?php
        include('../dist/includes/header_admin.php');
        include('../dist/includes/dbcon.php');
        ?>
        <!-- Full Width Column -->
        <div class="content-wrapper">
            <div class="container">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        <a class="btn btn-lg btn-warning" href="javascript:void(0)" onclick="window.history.back()">Back</a>
                        <a class="btn btn-lg btn-primary" href="view_accounts.php">View Accounts</a>                
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Supplier</li>
                    </ol>
                </section>

                <section class="content">

                    <div class="inline" style="display:inline; margin-top:3rem; ">
                        <div class="form-check form-check-inline" style="display:inline; padding:2rem; ">
                            <input class="form-check-input" type="radio" name="settingOption" id="option2" value="option2" checked>
                            <label class="form-check-label" for="option2">Finish unprocessed Transactions </label>
                        </div>
                        <div class="form-check form-check-inline" style="display:inline; padding:2rem;line-height:6rem;">
                            <input class="form-check-input" type="radio" name="settingOption" id="option1" value="option1">
                            <label class="form-check-label" for="option1">Edit/Remove Duplicates</label>
                        </div>
                    </div>

                    <br><br>

                    <form id="option2Form" style="margin-left: auto; margin-right:auto; width:70%; border:2px solid black; padding:1rem;" class="form" style="" action="add.php" method="POST">
                        <div class="form-group">
                            <label for="username">Description</label>
                            <input type="text" class="form-control" id="username" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Transaction type</label>
                            <select class="form-control" type="select" name="category">
                                <option>--Select payment method--</option>
                                <option>Invoice</option>
                                <option>Payment</option>
                                <option>Sale</option>
                                <option>Credit Note</option>
                                <option>Recieve payment</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="password">Transaction id</label>
                            <input type="text" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Amount</label>
                            <input type="number" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Payment Method </label>
                            <select class="form-control" type="select" name="category">
                                <option>--Select payment method--</option>
                                <?php
                                $query = mysqli_query($con, "SELECT * FROM modes_of_payment_tb ORDER by name") or die(mysqli_error($con));
                                while ($row = mysqli_fetch_assoc($query)) {
                                    $expName = $row['name'];
                                    echo "<option>$expName</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="password">Date</label>
                            <input type="date" class="form-control" id="password" name="password" required>
                        </div>

                        <br>
                        <p>Proof of Transaction</p>

                        <div class="form-group">
                            <h5>Attachement</h5>
                            <div class="drop-area" id="dropArea">
                                <p>Drag and drop files here or click to select files</p>
                                <input type="file" id="fileInput" name="file" style="display: none;" multiple>
                            </div>
                            <div id="fileList"></div>
                        </div>
                        <button type="submit" class="btn btn-primary" name="campus">Process</button>

                    </form>

                    <div id="option1Table" class="table" style="display: none;">                     
                        <table id="example" border="1" style="background:white; text-align:center;">                       
                            <thead>
                                <tr>
                                    <th> <input type="checkbox" name="All" value="" id="table_head_checkbox"></th>
                                    <th>NAME</th>
                                    <th>ACCOUNT NAME</th>
                                    <th>TRANSACTION TYPE</th>
                                    <th>ACCOUNT CODE</th>
                                    <th>TRANSACTION NO.</th>
                                    <th>DESCRIPTION</th>
                                    <th>DEBIT</th>
                                    <th>CREDIT</th>
                                    <th>STATUS</th>
                                    <th> <a id="completeTransactionBtn" class="btn btn-primary" onclick="return confirm('Are you sure you want to confirm single transaction ')">Confirm Transaction</b>
                                        <a  id="completeMultipleInvoicesBtn" class="btn btn-primary" onclick="return confirm('Are you sure you want to confirm  Multiple transaction' )">Confirm Multiple Transactions</a></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $id = $_GET['id'];
                                $queryz = "SELECT contra_transactions.transaction_type,contra_transactions.transaction_id,  bank.* FROM bank INNER JOIN contra_transactions ON bank.id = contra_transactions.bank_id WHERE bank_number = '$id'";
                                $resultz = mysqli_query($con, $queryz);
                                while ($rowz = mysqli_fetch_array($resultz)) {
                                    $Id = $rowz['id'];
                                    $name = $rowz['account_name'];
                                    $bank_name = $rowz['bank_name'];
                                    $code = $rowz['account_code'];
                                    $trans_type = $rowz['transaction_type'];
                                    $trans_id = $rowz['transaction_id'];
                                    $description = $rowz['description'];
                                    $debit = $rowz['debit'];
                                    $credit = $rowz['credit'];
                                ?>

                                    <tr>
                                        <td><input type="checkbox" class="invoice-checkbox" name="invoice[]" value="<?php echo $row['payment_id']; ?>"></td>
                                        <td><?php echo $bank_name; ?></td>
                                        <td><?php echo $name; ?></td>
                                        <td><?php echo $trans_type; ?></td>
                                        <td><?php echo $code; ?></td>
                                        <td><?php echo $trans_id; ?></td>
                                        <td><?php echo $description; ?></td>
                                        <td><?php echo $debit; ?></td>
                                        <td><?php echo $credit; ?></td>
                                         <td>
                                         <?php if ($row['status'] = 'Complete') {
                                                            echo "<p class='btn-danger' style='text-align:center;'> <strong> Pending </strong> </p>";
                                                        } else {
                                                            echo "<p class='btn-success' style='text-align:center;'> <strong> Confirmed </strong> </p>";
                                                        }   ?>
                                                    </td> 

                                        <td style="display: none;">
                                            <a href="update_form.php?id=<?php echo $Id; ?>" class="delete-button btn btn-success" data-id="<?php echo $Id; ?>" onclick="return confirm('Are you sure you want to update this record?')">Confirm</a>
                                         
                                        </td>

                                    </tr>

                                <?php
                                }
                                ?>

                            </tbody>

                        </table>
                    </div>
                </section>
            </div>
        </div>
        <?php include('../dist/includes/footer.php'); ?>
    </div>
    <script src="../plugins/select2/select2.full.min.js"></script>
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="../dist/js/app.min.js"></script>
    <script src="../dist/js/demo.js"></script>
    <script src="../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>


    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const radioButtons = document.querySelectorAll('input[name="settingOption"]');
            const option1Table = document.getElementById('option1Table');
            const forms = document.querySelectorAll('form');

            radioButtons.forEach((radio) => {
                radio.addEventListener('change', (event) => {
                    const selectedOption = event.target.value;

                    // Hide all forms and option1Table
                    forms.forEach((form) => {
                        form.style.display = 'none';
                    });
                    option1Table.style.display = 'none';

                    if (selectedOption === 'option1') {
                        option1Table.style.display = 'table';
                    } else {
                        const selectedForm = document.getElementById(selectedOption + 'Form');
                        if (selectedForm) {
                            selectedForm.style.display = 'block';
                        }
                    }
                });
            });
        });
    </script>


<script>
        $(function() {
            $("#example1").DataTable();
            $('#example').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": false
            });
        });

        $(document).ready(function() {
            // Get the checkbox in the table head
            var checkbox = $("#table_head_checkbox");

            checkbox.on("click", function() {

                var checkboxes = $("table tbody :checkbox");

                checkboxes.prop("checked", checkbox.prop("checked"));
            });
        });
    </script>


<script>
        const checkboxes = document.querySelectorAll('.invoice-checkbox');
        checkboxes.forEach((checkbox) => {
            checkbox.addEventListener('change', function() {
                if (this.checked) {
                    const row = this.closest('tr');
                    if (row) {
                        const Id = this.value; // Assuming ID is in the first cell (index 0)
                        const customerName = row.cells[1].textContent;
                        const invoiceNumber = row.cells[2].textContent;
                        const unitPrice = row.cells[3].textContent;
                        const totalPrice = row.cells[6].textContent;

                        document.getElementById('rowIdInput').value = Id;
                        document.getElementById('customerNameInput').value = customerName;
                        document.getElementById('invoiceNumberInput').value = invoiceNumber;
                        // document.getElementById('unitPriceInput').value = unitPrice;
                        document.getElementById('totalPriceInput').value = totalPrice;
                    }

                } else {

                }
            });
        });
    </script>

    <script>
        function updateButtonVisibility() {
            const checkboxes = document.querySelectorAll('.invoice-checkbox');
            const completeTransactionBtn = document.getElementById('completeTransactionBtn');
            const completeMultipleInvoicesBtn = document.getElementById('completeMultipleInvoicesBtn');           
            const table_head_checkbox = document.getElementById('table_head_checkbox');

            const isHeaderChecked = table_head_checkbox.checked;

            const checkedCheckboxes = Array.from(checkboxes).filter((checkbox) => checkbox.checked && checkbox !== table_head_checkbox);

            if (isHeaderChecked) {

                completeMultipleInvoicesBtn.style.display = 'block';
            } else if (checkedCheckboxes.length === 1) {
                completeTransactionBtn.style.display = 'block';
                completeMultipleInvoicesBtn.style.display = 'none';             
            } else if (checkedCheckboxes.length > 1) {
                completeTransactionBtn.style.display = 'none';
                completeMultipleInvoicesBtn.style.display = 'block';            
            } else {
                completeTransactionBtn.style.display = 'none';
                completeMultipleInvoicesBtn.style.display = 'none';               
            }
        }
        window.onload = function() {
            updateButtonVisibility();
        };
        const table_head_checkbox = document.getElementById('table_head_checkbox');

        checkboxes.forEach((checkbox) => {
            checkbox.addEventListener('change', function() {

                updateButtonVisibility();
            });
        });
        table_head_checkbox.addEventListener('change', function() {

            updateButtonVisibility();
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



</body>

</html>