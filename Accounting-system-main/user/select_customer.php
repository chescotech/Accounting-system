<?php
session_start();
if (empty($_SESSION['id'])) :
  header('Location:../index.php');
endif;

error_reporting(0)
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
  <script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
  <!-- AdminLTE Skins. Choose a skin from the css/skins
                 folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
  <style>
    #selectedRowsList {
      display: none !important;
    }
  </style>

</head>

<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav">
  <div class="wrapper">
    <?php
    include('../dist/includes/header.php');
    include('../Objects/Objects.php');
    $Objects = new InvObjects();

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
      $selected_cust_id = $_POST['selected_cust_id'];

      $queryz = mysqli_query($con, "SELECT * FROM customer WHERE cust_id = '$selected_cust_id'") or die(mysqli_error($con));

      // Check if a row was found
      if ($rowz = mysqli_fetch_array($queryz)) {
        $cust_first = $rowz['cust_first'];
        // Now $cust_first contains the cust_first value of the selected customer
      }
    }

    ?>

    <!-- Full Width Column -->
    <div class="content-wrapper">
      <div class="container">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            <a class="btn btn-lg btn-warning" href="Javascript:history.back()">Back</a>
            <a class="btn btn-lg btn-primary" href="select_customer_credit.php" style="color:#fff;" class="small-box-footer">New Invoice <i class="glyphicon glyphicon-plus text-blue"></i></a>
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
                  <h3 class="box-title" style=" color: black"><b>Invoice List</b></h3>
                </div>




                <div style="margin: 1rem;">

                  <div class="form-group" style="display: flex;">
                    <!-- <div class="depo">
                      <label for="date">Deposit to </label>

                      <select class="form-control" type="select" name="pa" required>
                        <?php
                        $query = mysqli_query($con, "SELECT * FROM payment_account WHERE name IS NOT NULL AND name != '' ORDER BY name") or die(mysqli_error($con));
                        while ($row = mysqli_fetch_assoc($query)) {
                          $payName = $row['name'];
                          echo "<option>$payName</option>";
                        }
                        ?>
                      </select>
                    </div>

                    <div class="buttons" style="margin:2.5rem; display:flex;">
                      <button type="button" name="" class="btn btn-success" onclick="$('#addPaymentAccountModal').modal('show');" style="margin-right: 0.5em;"> + Add </button>                     
                    </div> -->
                    <div class="complete" style="display: flex; justify-content:flex-end;">
                      <div class="buttons" style="margin:1rem; display:flex;">
                        <button type="button" id="completeTransactionBtn" class="btn btn-success" onclick="$('#complete').modal('show');" style="margin-right: 0.5em;">Complete Transaction</button>
                        <button type="button" id="completeMultipleInvoicesBtn" class="btn btn-success" onclick="openMultipleRowsModal();">Complete Multiple Invoices</button>

                      </div>
                    </div>

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

                  </div>

                </div>

                <div class="box-body">
                  <p id="instructionMessage" style="color: red;"> <b>Check one or more invoices to proceed.</b></p>
                  <?php echo $cust_first; ?>
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th> <input type="checkbox" name="All" value="" id="table_head_checkbox"></th>
                        <th>Customers Name</th>
                        <th>Invoice Number</th>
                        <th>Total Price</th>
                        <th>Balance</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $groupedRows = [];

                      $query = mysqli_query($con, "SELECT dt.date, dt.customer_name, dt.temp_trans_id, dt.date2collect, dt.order_no, dt.qty, dt.price, 
                                           SUM(dt.qty) AS totalqty, SUM(dt.price) AS total, SUM(pp.amount) AS totalAmountDue,
                                           (SELECT SUM(dt2.price * dt2.qty) FROM `draft_temp_trans` dt2 WHERE dt2.order_no = dt.order_no) AS grandTotal
                                           FROM `draft_temp_trans` dt
                                           LEFT JOIN `part_payments_tb` pp ON dt.order_no = pp.order_no
                                           WHERE dt.customer_name = '$cust_first'                                        
                                           GROUP BY dt.temp_trans_id") or die(mysqli_error($con));

                      while ($row = mysqli_fetch_array($query)) {
                        $orderNo = $row['order_no'];
                        $tid = $row['temp_trans_id'];


                        if (array_key_exists($orderNo, $groupedRows)) {

                          $groupedRows[$orderNo]['qty'] += $row['qty'];
                          $groupedRows[$orderNo]['total'] += $row['total'];
                          $groupedRows[$orderNo]['totalAmountDue'] = $row['totalAmountDue'];
                          $groupedRows[$orderNo]['grandTotal'] += $row['grandTotal'];

                          $groupedRows[$orderNo]['difference'] = ($groupedRows[$orderNo]['total']) - ($groupedRows[$orderNo]['totalAmountDue']);
                        } else {

                          $groupedRows[$orderNo] = [
                            'customer_name' => $row['customer_name'],
                            'qty' => $row['qty'],
                            'total' => $row['total'],
                            'totalAmountDue' => $row['totalAmountDue'],
                            'grandTotal' => $row['grandTotal'],
                            'difference' => $row['total'] - $row['totalAmountDue'],
                          ];
                        }
                      }

                      foreach ($groupedRows as $orderNo => $groupedRow) {
                      ?>
                        <tr>
                          <td><input type="checkbox" class="invoice-checkbox" name="invoice[]" value="<?php echo $tid; ?>"></td>
                          <td><?php echo $groupedRow['customer_name']; ?></td>
                          <td><?php echo $orderNo; ?></td>
                          <td><?php echo $groupedRow['total']; ?></td>
                          <td><?php echo $groupedRow['difference']; ?></td>
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
            const totalPrice = row.cells[4].textContent;


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
            const unitPrice = row.cells[3].textContent;
            const totalPrice = parseFloat(row.cells[4].textContent);
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
          const totalPrice = parseFloat(row.cells[4].textContent);
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
</body>

</html>