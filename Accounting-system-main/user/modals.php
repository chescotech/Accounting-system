<?php include '../dist/includes/dbcon.php' ?>


<div class="modal fade" id="multipleRowsModal" tabindex="-1" aria-labelledby="multipleRowsModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Select Multiple Rows</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">                
                <ul id="selectedRowsList">         
                </ul>
                <!-- Form to collect deposit and submit data -->
                <form id="invoiceForm" method="post" action="multipleinvoice.php">
                    <!-- Hidden input fields to store selected invoice numbers and IDs -->                    
                    <input type="hidden" name="selectedInvoiceNumbers" id="selectedInvoiceNumbers">
                    <input type="hidden" name="selectedIds" id="selectedIds">
                    <div class="form-group" style="display: flex;">
                        <div class="depo">
                            <label for="date">Deposit to </label>
                            <select class="form-control" type="select" name="pa" required>
                                <?php
                                $query = mysqli_query($con, "SELECT * FROM payment_account WHERE name IS NOT NULL AND name != '' ORDER BY name") or die(mysqli_error($con));
                                while ($row = mysqli_fetch_assoc($query)) {
                                    $payName = $row['name'];
                                    $pid = $row['id'];                                    
                                    echo "<option value='$pid'>$payName</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="buttons" style="margin:2.5rem; display:flex;">
                            <button type="button" name="" class="btn btn-success" onclick="$('#addPaymentAccountModal').modal('show');" style="margin-right: 0.5em;"> + Add </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="modeOfPayment">Mode of Payment</label>
                        <select class="form-control select2" name="payment_mode_id" tabindex="1">
                            <?php
                            $query2 = mysqli_query($con, "select * from modes_of_payment_tb") or die(mysqli_error($con));
                            while ($row = mysqli_fetch_array($query2)) {
                            ?>
                                <option value="<?php echo $row['payment_mode_id']; ?>"><?php echo $row['name']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <input type="hidden" name="grandTotal" id="grandTotalInput">
                    <input type="hidden" value="<?php echo $selected_cust_id ?>" name="cid">
                </form>
                
                <p><span type="text" name="grandTotal" id="grandTotal"></span></p>
                <!-- Display the grand total here -->
                <p>Total Amount for multiple rows: <span id="grandTotal"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="processSelectedRows();">Process Selected Rows</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="complete" tabindex="-1" aria-labelledby="complete" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="completeTitle">Complete Payment</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="payment" id="paymentForm" action="singleinvoice.php" method="post" style="width: 50rem;">
                <div class="modal-body">
                    <p>Total Amount for single rows:<b> <span id="grandTotal"></span></b></p>
                    <!-- Deposit to -->
                    <div class="form-group" style="display: flex;">
                        <div class="depo">
                            <label for="date">Deposit to </label>
                            <select class="form-control" type="select" name="pa" required>
                                <?php
                                $query = mysqli_query($con, "SELECT * FROM payment_account WHERE name IS NOT NULL AND name != '' ORDER BY name") or die(mysqli_error($con));
                                while ($row = mysqli_fetch_assoc($query)) {
                                    $payName = $row['name'];
                                    $pid = $row['id'];
                                    echo "<option value='$pid'>$payName</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="buttons" style="margin:2.5rem; display:flex;">
                            <button type="button" name="" class="btn btn-success" onclick="$('#addPaymentAccountModal').modal('show');" style="margin-right: 0.5em;"> + Add </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="hidden" id="rowIdInput" name="row_id" readonly class="form-control"> <!-- Hidden input field to store row ID -->
                    </div>

                    <input type="hidden" value="<?php echo $selected_cust_id ?>" name="cid">

                    <div class="form-group">
                        <label for="customerNameInput">Customer Name</label>
                        <input type="text" id="customerNameInput" name="customer_name" readonly class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="invoiceNumberInput">Invoice Number</label>
                        <input type="text" id="invoiceNumberInput" name="invoice_number" readonly class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="totalPriceInput">Total Price</label>
                        <input type="text" id="totalPriceInput" name="total_price" readonly class="form-control">
                    </div>
                    <!-- <div class="form-group">
                        <label for="tender">Cash Amount</label>
                        <input type="number" id="tender" name="tender" class="form-control" required>
                    </div> -->
                    <div class="form-group">
                        <label for="modeOfPayment">Mode of Payment</label>
                        <select class="form-control select2" name="payment_mode_id" tabindex="1">
                            <?php
                            $query2 = mysqli_query($con, "select * from modes_of_payment_tb") or die(mysqli_error($con));
                            while ($row = mysqli_fetch_array($query2)) {
                            ?>
                                <option value="<?php echo $row['payment_mode_id']; ?>"><?php echo $row['name']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="account<?php echo $row['id']; ?>" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content" style="height:auto">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Are u sure you want to delete this Account ?
                </h4>
            </div>
            <div class="modal-body" hidden="">
                <form class="form-horizontal" method="post" action="deleteaccount.php" enctype='multipart/form-data'>
                    <div class="form-group">
                        <label class="control-label col-lg-3" for="name">Category</label>
                        <div class="col-lg-9"><input type="hidden" class="form-control" id="id" name="id" value="<?php echo $row['id']; ?>" required>
                            <input type="text" class="form-control" id="name" name="id" value="<?php echo $row['id']; ?>" required>
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

    </div><!--end of modal-dialog-->
</div>

<div id="updateordinance<?php echo $row['id']; ?>" class="modal fade" tabindex="-1" style="padding: 0.2rem;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Update Expense</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" action="update_expense.php" enctype='multipart/form-data'>

                    <div class="form-group">
                        <label for="name">Expense Description</label>
                        <div class="input-group col-md-12"><input type="hidden" class="form-control" id="id" name="id" value="<?php echo $row['id']; ?>" required>
                            <textarea class="form-control pull-right" id="date" name="description" placeholder="Amount" required><?php echo $row['description']; ?></textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="date">Category</label>
                        <select class="form-control" type="select" name="category">
                            <option><?php echo $expName; ?></option>
                            <?php
                            $query9 = mysqli_query($con, "SELECT * FROM expense_types_tb") or die(mysqli_error($con));
                            while ($row9 = mysqli_fetch_assoc($query9)) {
                                $expName = $row9['exp_name'];
                                echo "<option>$expName</option>";
                            }
                            ?>
                        </select>

                    </div>

                    <div class="form-group">
                        <label for="date">Payee</label>
                        <select class="form-control" type="select" name="supplier">
                            <option><?php echo $supName; ?></option>
                            <?php
                            $query8 = mysqli_query($con, "SELECT * FROM supplier") or die(mysqli_error($con));
                            while ($row8 = mysqli_fetch_assoc($query8)) {
                                $supName = $row8['supplier_name'];
                                echo "<option>$supName</option>";
                            }
                            ?>
                        </select>

                    </div>

                    <!-- <div class="form-group">
                        <label for="date">Date</label>
                        <div class="input-group col-md-12">                           
                            <input type="date" name="date" class="form-control" value="<?php echo $row['date']; ?>">  
                        </div>
                    </div> -->

                    <div class="form-group">
                        <label> Payment method</label>
                        <div class="input-group col-md-12">
                            <select class="form-control" type="select" name="pay">
                                <option><?php echo $row['payment_method']; ?></option>
                                <option>Credit card</option>
                                <option>Debit card</option>
                                <option>Cheque</option>
                                <option>Cash</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="date">Amount</label>
                        <div class="input-group col-md-12">
                            <input type="text" class="form-control" id="name" name="amount" value="<?php echo $row['amount']; ?>" required>
                        </div><!-- /.input group -->
                    </div><!-- /.form group -->
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Save changes</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
            </form>
        </div>

    </div><!--end of modal-dialog-->
</div>

<div id="delete<?php echo $row['id']; ?>" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content" style="height:auto">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Are u sure you want to delete this expense ??
                </h4>
            </div>
            <div class="modal-body" hidden="">
                <form class="form-horizontal" method="post" action="delete-expense.php" enctype='multipart/form-data'>
                    <div class="form-group">
                        <label class="control-label col-lg-3" for="name">Category</label>
                        <div class="col-lg-9"><input type="hidden" class="form-control" id="id" name="id" value="<?php echo $row['id']; ?>" required>
                            <input type="text" class="form-control" id="name" name="id" value="<?php echo $row['id']; ?>" required>
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

    </div><!--end of modal-dialog-->
</div>

<div class="modal fade " id="addPaymentAccountModal" tabindex="-1" aria-labelledby="addPaymentAccountModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addPaymentAccountModalLabel">Add Payment Account</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="payment" action="add_account.php" method="post" style="width: 50rem;">
                    <div class="left" style="display: flex !important;
                                   flex-direction: row !important;
                                   justify-content: flex-start !important;">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter payment account name" required>
                        </div>

                        <div class="form-group">
                            <label for="bank_name">Account type</label>
                            <select class="form-control" name="account_type">
                                <option>-- --</option>
                                <option>Current Assests</option>
                                <option>Credit Card</option>
                                <option>Cash & Cash Equivilants</option>
                            </select>
                        </div>
                    </div><br>
                    <div class="form-group">
                        <label for="bank_name">Description</label>
                        <textarea type="textarea" class="form-control" id="description" name="description" placeholder="enter description"> </textarea>
                    </div>
                    <div class="right" style="display: flex !important;
                                flex-direction: row !important;
                                justify-content: flex-end !important;">
                        <div class="form-group">
                            <label for="name">Detail type</label>
                            <select class="form-control" name="detail_type">
                                <option>-- --</option>
                                <option>Bank</option>
                                <option>Cash and Cash Eqivilants</option>
                                <option>Cash on Hand</option>
                                <option>Client trust account </option>
                                <option>Money Market</option>
                                <option>Rents Held in Trust</option>
                                <option>Savings</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="bank_name">Balance</label>
                            <input type="text" name="Balance" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="bank_name">as of</label>
                            <input type="date" name="date" class="form-control">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

<div id="updateaccount<?php echo $row['id']; ?>" class="modal fade" tabindex="-1" style="padding: 0.2rem;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Update Account Details</h4>
            </div>
            <div class="modal-body">
                <form class="payment" action="update_account.php" method="post" style="width: 100rem;">
                    <div class="left" style="display: flex !important;
                                   flex-direction: row !important;
                                   justify-content: flex-start !important;">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter payment account name" required value="<?php echo $row['name']; ?>">
                        </div>

                        <div class="form-group">
                            <label for="bank_name">Account type</label>
                            <select class="form-control" name="account_type">
                                <option><?php echo $row['account_type']; ?></option>
                                <option>Current Assests</option>
                                <option>Credit Card</option>
                                <option>Cash & Cash Equivilants</option>
                            </select>
                        </div>
                    </div><br>
                    <div class="form-group">
                        <label for="bank_name">Description</label>
                        <textarea type="textarea" class="form-control" id="description" name="description" placeholder="enter description"><?php echo $row['description']; ?> </textarea>
                    </div>
                    <div class="right" style="display: flex !important;
                                flex-direction: row !important;
                                justify-content: flex-end !important;">
                        <div class="form-group">
                            <label for="name">Detail type</label>
                            <select class="form-control" name="detail_type">
                                <option><?php echo $row['detail_type']; ?></option>
                                <option>Bank</option>
                                <option>Cash and Cash Eqivilants</option>
                                <option>Cash on Hand</option>
                                <option>Client trust account </option>
                                <option>Money Market</option>
                                <option>Rents Held in Trust</option>
                                <option>Savings</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="bank_name">Balance</label>
                            <input type="text" name="Balance" class="form-control" value="<?php echo $row['balance']; ?>">
                        </div>
                        <div class="form-group">
                            <label for="bank_name">as of</label>
                            <input type="date" name="date" class="form-control" value="<?php echo $row['date']; ?>">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">update</button>
                    </div>
                </form>
            </div>

        </div>
    </div>