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
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../plugins/select2/select2.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <style>
        #selectedRowsList {
            display: none !important;
        }
    </style>
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

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Supplier</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-9">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Supplier Payments</h3>
                                </div><!-- /.box-header -->

                                <!-- <div class="complete" style="display: flex; justify-content:flex-end;">
                                    <div class="buttons" style="margin:1rem; display:flex;">
                                        <button type="button" id="completeTransactionBtn" class="btn btn-success" onclick="$('#complete').modal('show');" style="margin-right: 0.5em;">Complete Single Payment</button>
                                        <button type="button" id="completeMultipleInvoicesBtn" class="btn btn-success" onclick="openMultipleRowsModal();">Complete Multiple Payments</button>

                                    </div>
                                </div> -->


                                <div class="box-body">
                                    <!-- <p id="instructionMessage" style="color: red;"> <b>Check one or more Pending payments to proceed.</b></p> -->
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <!-- <th> <input type="checkbox" name="All" value="" id="table_head_checkbox"></th> -->
                                                <th>Supplier Name</th>
                                                <th>Invoice #</th>
                                                <th>Date Added</th>
                                                <th>Total Amount Due</th>
                                                <th>Amount Paid</th>
                                                <th>Balance</th>
                                                <th>Del</th>
                                                <!-- <th>Status</th> -->
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $query = mysqli_query($con, "SELECT * FROM `supplier_payments_tb` INNER JOIN supplier ON supplier.supplier_id=supplier_payments_tb.supplier_id") or die(mysqli_error($con));
                                            while ($row = mysqli_fetch_array($query)) {
                                            ?>
                                                <tr>
                                                    <!-- <td><input type="checkbox" class="invoice-checkbox" name="invoice[]" value="<?php echo $row['payment_id']; ?>"></td> -->
                                                    <td><?php echo $row['supplier_name']; ?></td>
                                                    <td><?php echo $row['invoice_no']; ?></td>
                                                    <td><?php echo $row['date_added']; ?></td>
                                                    <td><?php echo number_format($row['total_amount'], 2); ?></td>
                                                    <td><?php echo number_format($row['amount_paid'], 2); ?></td>
                                                    <td><?php
                                                        $balance = $row['total_amount'] - $row['amount_paid'];
                                                        echo number_format($balance, 2);
                                                        ?></td>
                                                    <td>
                                                        <a href="#delete<?php echo $row['payment_id']; ?>" data-target="#delete<?php echo $row['payment_id']; ?>" data-toggle="modal" style="color:#fff;" class="small-box-footer"><i class="glyphicon glyphicon-trash text-blue"></i></a>
                                                    </td>

                                                    <!-- <td>
                                                        <?php if ($row['balance'] > 0) {
                                                            echo "<p class='btn-danger' style='text-align:center;'> <strong> Pending Payment </strong> </p>";
                                                        } else {
                                                            echo "<p class='btn-success' style='text-align:center;'> <strong> Fully Paid </strong> </p>";
                                                        }   ?>
                                                    </td> -->
                                                </tr>
                                                <div id="delete<?php echo $row['payment_id']; ?>" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content" style="height:auto">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title">Are u sure you want to delete this??
                                                                </h4>
                                                            </div>
                                                            <div class="modal-body" hidden="">
                                                                <form class="form-horizontal" method="post" action="delete-payment.php" enctype='multipart/form-data'>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-lg-3" for="name">Category</label>
                                                                        <div class="col-lg-9"><input type="hidden" class="form-control" id="id" name="payment_id" value="<?php echo $row['payment_id']; ?>" required>
                                                                            <input type="text" class="form-control" id="name" name="payment_id" value="<?php echo $row['payment_id']; ?>" required>
                                                                        </div>
                                                                    </div>
                                                            </div>
                                                            <hr>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary">Delete</button>
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                            </div>
                                                            </form>
                                                        </div>

                                                    </div>
                                                </div>


                                            <?php } ?>
                                        </tbody>

                                    </table>
                                </div>

                            </div>


                        </div><!-- /.row -->
                        <div class="col-md-3">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Add New Supplier Payment</h3>
                                </div>
                                <div class="box-body">
                                    <!-- Date range -->
                                    <form method="post" action="supplier_payment_add.php" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="date">Invoice #</label>
                                            <div class="input-group col-md-12">
                                                <input class="form-control pull-right" id="date" name="invoice_no" placeholder="Enter Invoice #" required></input>
                                            </div><!-- /.input group -->
                                        </div>

                                        <div class="form-group">
                                            <label for="date">Supplier Details</label>
                                            <div class="form-group">
                                                <div class="col-lg-9">
                                                    <select class="form-control select2" style="width: 100%;" name="supplier" required>
                                                        <?php
                                                        $query2 = mysqli_query($con, "select * from supplier") or die(mysqli_error($con));
                                                        while ($row2 = mysqli_fetch_array($query2)) {
                                                        ?>
                                                            <option value="<?php echo $row2['supplier_id']; ?>"><?php echo $row2['supplier_name']; ?></option>
                                                        <?php } ?>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="date">Total Amount to be Paid</label>
                                            <div class="input-group col-md-12">
                                                <input class="form-control pull-right" id="date" name="total_amount" placeholder="Total Amount to be Paid" required></input>
                                            </div><!-- /.input group -->
                                        </div><!-- /.form group -->
                                        <div class="form-group">
                                            <label for="date">Amount Paid</label>
                                            <div class="input-group col-md-12">
                                                <input type="text" class="form-control pull-right" id="date" name="amount_paid" placeholder="Amount Paid" required>
                                            </div>
                                        </div>

                                        <div class="form-group com">
                                            <label>Bank Name</label>
                                            <select class="form-control" name="selected_bank" id="selected_bank" required>
                                                <option value="">--Select Bank--</option>
                                                <?php
                                                $query = mysqli_query($con, "SELECT id, bank_name FROM bank ORDER by bank_name") or die(mysqli_error($con));
                                                while ($row = mysqli_fetch_assoc($query)) {
                                                    $bank_id = $row['id'];
                                                    $expName = $row['bank_name'];
                                                    echo "<option value='$bank_id'>$expName</option>";
                                                }
                                                ?>
                                            </select>
                                        </div>

                                        <input type="hidden" name="selected_bank_name" value="">

                                        <div class="form-group com">
                                            <label>Bank Account Name</label>
                                            <select class="form-control" name="selected_account" id="selected_account">
                                                <option value="">--Select Bank Account--</option>
                                            </select>
                                        </div>

                                        <div class="form-group com">
                                            <label>Business Account</label>
                                            <select class="form-control" name="payment_account">
                                                <option value="">--Select payment method--</option>
                                                <?php
                                                $query = mysqli_query($con, "SELECT * FROM payment_account ORDER by name") or die(mysqli_error($con));
                                                while ($row = mysqli_fetch_assoc($query)) {
                                                    $expName = $row['name'];
                                                    echo "<option value='$expName'>$expName</option>";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                        <br>

                                        <div class="form-group">
                                            <div class="input-group">
                                                <button class="btn btn-primary" id="daterange-btn" name="">
                                                    Save
                                                </button>
                                                <button class="btn" id="daterange-btn">
                                                    Clear
                                                </button>
                                            </div>
                                        </div><!-- /.form group -->
                                    </form>
                                    <script>
                                        document.querySelector('#selected_bank').addEventListener('change', function() {
                                            var selectedBankId = this.value;
                                            var accountSelect = document.querySelector('#selected_account');
                                            accountSelect.innerHTML = '<option value="">Loading...</option>';
                                            var xhr = new XMLHttpRequest();
                                            xhr.open('POST', '../user/fetch_accounts.php', true);
                                            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                            xhr.onreadystatechange = function() {
                                                if (xhr.readyState === 4 && xhr.status === 200) {
                                                    accountSelect.innerHTML = xhr.responseText;
                                                }
                                            };
                                            xhr.send('bank_id=' + selectedBankId);
                                        });
                                    </script>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div><!-- /.col (right) -->
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
        const selectedRows = [];

        function openMultipleRowsModal() {
            let grandTotal = 0;
            selectedRows.length = 0;
            const checkboxes = document.querySelectorAll('.invoice-checkbox');
            checkboxes.forEach((checkbox) => {
                if (checkbox.checked) {
                    const Id = checkbox.value;
                    const row = checkbox.closest('tr');
                    if (row) {
                        const customerName = row.cells[1].textContent;
                        const invoiceNumber = row.cells[2].textContent;
                        const unitPrice = parseFloat(row.cells[3].textContent); // Parse as float
                        const totalPrice = parseFloat(row.cells[6].textContent); // Parse as float
                        grandTotal += totalPrice; // Add totalPrice to grandTotal

                        selectedRows.push({
                            Id,
                            customerName,
                            invoiceNumber,
                            unitPrice,
                            totalPrice,
                        });
                    }
                }
            });
            const selectedRowsList = document.getElementById('selectedRowsList');
            selectedRowsList.innerHTML = '';
            selectedRows.forEach((row) => {
                const listItem = document.createElement('li');
                listItem.textContent = ` ID: ${row.Id}, Customer Name: ${row.customerName}, Invoice Number: ${row.invoiceNumber}, Unit Price: ${row.unitPrice}, Total Price: ${row.totalPrice}`;
                selectedRowsList.appendChild(listItem);
            });

            $('#multipleRowsModal').modal('show');
            const grandTotalElement = document.getElementById('grandTotal');
            grandTotalElement.textContent = grandTotal.toFixed(2);
            console.log(grandTotalElement);
        }


        function processSelectedRows() {
            // Calculate the grand total
            const selectedRows = document.querySelectorAll('.invoice-checkbox:checked');
            const grandTotalInput = document.getElementById('grandTotalInput');
            let grandTotal = 0;
            let grand = 0;
            const selectedInvoiceNumbers = [];
            const selectedIds = [];
            selectedRows.forEach((checkbox) => {
                const row = checkbox.closest('tr');
                if (row) {
                    const totalPrice = parseFloat(row.cells[6].textContent);
                    grandTotal += totalPrice;
                    grand += totalPrice;
                    const invoiceNumber = row.cells[2].textContent;
                    const Id = checkbox.value;
                    selectedInvoiceNumbers.push(invoiceNumber);
                    selectedIds.push(Id);
                }
            });
            // Set the grand total value in the hidden input field
            document.getElementById('grandTotalInput').value = grand.toFixed(2);
            // Update the grand total display
            document.getElementById('grandTotal').textContent = grandTotal.toFixed(2);
            // Set the selected invoice numbers and IDs as values in the form fields
            document.getElementById('selectedInvoiceNumbers').value = selectedInvoiceNumbers.join(',');
            document.getElementById('selectedIds').value = selectedIds.join(',');
            // Submit the form
            document.getElementById('invoiceForm').submit();
            grandTotalInput.value = grandTotal.toFixed(2);
        }
    </script>

    <script>
        function updateButtonVisibility() {
            const checkboxes = document.querySelectorAll('.invoice-checkbox');
            const completeTransactionBtn = document.getElementById('completeTransactionBtn');
            const completeMultipleInvoicesBtn = document.getElementById('completeMultipleInvoicesBtn');
            const instructionMessage = document.getElementById('instructionMessage');
            const table_head_checkbox = document.getElementById('table_head_checkbox');

            const isHeaderChecked = table_head_checkbox.checked;

            const checkedCheckboxes = Array.from(checkboxes).filter((checkbox) => checkbox.checked && checkbox !== table_head_checkbox);

            if (isHeaderChecked) {

                completeMultipleInvoicesBtn.style.display = 'block';
            } else if (checkedCheckboxes.length === 1) {
                completeTransactionBtn.style.display = 'block';
                completeMultipleInvoicesBtn.style.display = 'none';
                instructionMessage.style.display = 'none';
            } else if (checkedCheckboxes.length > 1) {
                completeTransactionBtn.style.display = 'none';
                completeMultipleInvoicesBtn.style.display = 'block';
                instructionMessage.style.display = 'none';
            } else {
                completeTransactionBtn.style.display = 'none';
                completeMultipleInvoicesBtn.style.display = 'none';
                instructionMessage.style.display = 'block'; // Display the instruction message
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

    <?php include './modals.php' ?>

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