<?php
//session_start();
if (empty($_SESSION['id'])) :
    header('Location:../index.php');
endif;
date_default_timezone_set("Africa/Lusaka");
?>
<?php
include('../dist/includes/dbcon.php');

$branch = $_SESSION['branch'];
$query = mysqli_query($con, "select * from branch where branch_id='$branch'") or die(mysqli_error($con));
$row = mysqli_fetch_array($query);
$branch_name = $row['branch_name'];

// activate the discounts..
$query2 = mysqli_query($con, "SELECT * FROM discount_tb WHERE DATE(discount_from) >= DATE(NOW()) AND  DATE(discount_to) <= DATE(NOW()) AND status='active' ") or die(mysqli_error($con));
while ($row1 = mysqli_fetch_array($query2)) {
    $discount_price = $row1['discount_price'];
    $id = $row1['prod_id'];
    mysqli_query($con, "update product set prod_sell_price='$discount_price'  where prod_id='$id'") or die(mysqli_error($con));
}

// deactivate the active discounts..
$query3 = mysqli_query($con, "SELECT * FROM discount_tb WHERE DATE(NOW()) > DATE(discount_from) AND status='active'") or die(mysqli_error($con));
while ($row1 = mysqli_fetch_array($query3)) {
    $discount_price = $row1['discount_price'];
    $id = $row1['prod_id'];
    mysqli_query($con, "UPDATE discount_tb SET status='notactive' WHERE prod_id='$id' ") or die(mysqli_error($con));
    mysqli_query($con, "update product set prod_sell_price='$discount_price' where prod_id='$id'") or die(mysqli_error($con));
}
?>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
    .navbar-brand {
        margin: 1rem;
        background-color: #3c8d !important;
        border-radius: 5%;
        color: black !important;
        font-size: smaller;
    }

    .main-header .navbar {
        display: flex !important;
        background: rgba(0, 0, 0, 0.8) !important;
        /* background: rgb(255,255,120,0.9) !important; */
        color: white;
        border-bottom: 6px solid #3c8d;
        border-top: 6px solid #3c8d;

    }

    .main-header .navbar li {
        color: white;
        margin: 0.5rem;
    }

    .main-header .navbar .nav>li>a {
        color: white !important;
        transition: color 0.3s ease;
    }

    .main-header .navbar .nav>li>a:hover {
        background-color: #3c8d !important;
        /* Change the background color on hover */
        border-radius: 5%;
        transition: background-color 0.7s ease-out;
        color: white !important;
    }

    .main-header a i:hover {
        color: black !important;
    }

    .main-header .glyphicon {
        color: #3c8d !important;
        margin: 0.4rem;
    }

    .main-header .dropdown-menu .glyphicon {
        color: black !important;
        margin: 0.4rem;
    }

    .main-header li {
        font-size: small;
    }

    .dropdown-menu {
        max-height: 400px;

        overflow-y: auto;
        position: fixed;
        top: 0;
    }
</style>



<header class="main-header">
    <nav class="navbar navbar-static-top" >
        <div class="container-fluid">
            <div class="navbar-header" style="padding-left:20px">
                <a href="../AdminPortal/home.php" class="navbar-brand"><b><i class="glyphicon glyphicon-home"></i> <?php echo $branch_name; ?> </b></a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <i class="fa fa-bars"></i>
                </button>
            </div>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown notifications-user">
                        <a href="../AdminPortal/home.php">
                            <i class="glyphicon glyphicon-home text-green"></i> Home
                        </a>
                    </li>
                    <li class="dropdown notifications-menu">
                        <a id="setup" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-wrench"></i> Setup
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">
                                    <li>
                                        <a href="../AdminPortal/company-setup">
                                            <i class="glyphicon glyphicon-user text-green"> Company Setup</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/branch-setup">
                                            <i class="glyphicon glyphicon-user text-green"> Branch Setup</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/manage-warehouses">
                                            <i class="glyphicon glyphicon-user text-green"> Warehouses Setup</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/cashout-limits">
                                            <i class="glyphicon glyphicon-scissors text-green"> Cashout Limits</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/modes-of-payment">
                                            <i class="glyphicon glyphicon-user text-green"> Payment Modes</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/category">
                                            <i class="glyphicon glyphicon-user text-green"></i> Item Categories
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="../AdminPortal/supplier.php">
                                            <i class="glyphicon glyphicon-send text-green"></i> Suppliers
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="../AdminPortal/supplier_payments">
                                            <i class="glyphicon glyphicon-send text-green"></i> Supplier Payments
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="expenses">
                                            <i class="glyphicon glyphicon-send text-green"></i> Expenses
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="../AdminPortal/expense_types">
                                            <i class="glyphicon glyphicon-send text-green"></i> Expense Types
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="../AdminPortal/customer">
                                            <i class="glyphicon glyphicon-send text-green"></i> Customers
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="../AdminPortal/inventory-list">
                                            <i class="glyphicon glyphicon-send text-green"></i> Inventory Records
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown notifications-user">
                        <a href="../AdminPortal/expenses">
                            <i class="glyphicon glyphicon-user text-green"></i> Expenses
                        </a>
                        <ul class="dropdown-menu">
                        </ul>
                    </li>

                    <li class="dropdown notifications-user">
                        <a href="credit_customer">
                            <i class="glyphicon glyphicon-user text-green"></i> credit Note
                        </a>
                        <ul class="dropdown-menu">
                        </ul>
                    </li>

                    <li class="dropdown notifications-menu">
                        <a id="stock" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-wrench"></i> Invoicing 
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">

                                    <li>
                                        <a href="draft-sale">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Invoices
                                        </a>
                                    </li>

                                    <li>
                                        <a href="quotation.php">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Quotation
                                        </a>
                                    </li>

                                    <li>
                                        <a href="sales_receipt.php">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Sales Reciept
                                        </a>
                                    </li>

                                    <li>
                                        <a href="recieve_payment.php">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Recieve Payments
                                        </a>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                    </li>


                    <li class="dropdown notifications-menu">
                        <a id="stock" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-wrench"></i> Stock
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">

                                    <li>
                                        <a href="../AdminPortal/product">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Manage Products
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/transfer_select.php">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Purchase Stock
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/bulk-entry">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Bulk Upload
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/ware-house-stock">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Manage Warehouse Stock
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/input-reversal">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Manage Reversal
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/input-invoiceno">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Credit Note
                                        </a>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown notifications-user">
                        <a href="../AdminPortal/users">
                            <i class="glyphicon glyphicon-user text-green"></i> Users
                        </a>
                        <ul class="dropdown-menu">


                        </ul>
                    </li>

                    <li class="dropdown notifications-menu">
                        <a id="reports" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-stats"></i> Reports
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">
                                    <li>
                                        <a href="../AdminPortal/userauditreport">
                                            <i class="glyphicon glyphicon-stats text-green"></i> User Audits
                                        </a>
                                    </li>
                                    <li>
                                        <a href="../AdminPortal/accountschart.php">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Chart of Accounts
                                        </a>
                                    </li>
                                    <li>
                                        <a href="../AdminPortal/general_ledger.php">
                                            <i class="glyphicon glyphicon-stats text-green"></i> General Ledger
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/cash_flow.php">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Cash Flow
                                        </a>
                                    </li>
                                    <li>
                                        <a href="../AdminPortal/product-shortages">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Product Shortages
                                        </a>
                                    </li>
                                    <li>
                                        <a href="../AdminPortal/supplier-payments-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Supplier Payments Report
                                        </a>
                                    </li>
                                    <li>
                                        <a href="../AdminPortal/sales-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Sales Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/customer-invoices">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Customer Invoices Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/transaction-history">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Transaction History Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/product-expiry-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Product Expiry Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/part-payments-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Part Payments Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/advance-payments">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Advance Payments Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/expenses-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Expenses Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/profit-loss-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Profit Loss Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/stock-transfer-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Stock Transfer Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/open-close-cash-out-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Open Close Cash Out Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/user-cash-out-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> User Cash Out Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/ware-house-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Warehouse Count Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/stock-count">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Stock Count Report
                                        </a>
                                    </li>


                                    <li>
                                        <a href="../AdminPortal/discounts-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Discounts Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/stock-damages-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Damages Report
                                        </a>
                                    </li>



                                    <li>
                                        <a href="../AdminPortal/stock-audits-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Stock Audit Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../AdminPortal/draft-sales-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Credit Sales
                                        </a>
                                    </li>
                                    <li>
                                        <a href="../AdminPortal/open-close-balances">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Balances Report
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li class="">
                        <a href="../AdminPortal/home" class="dropdown-toggle">
                            <i class="glyphicon glyphicon-cog text-orange"></i>
                            Switch User Acc
                        </a>
                    </li>
                    <li class="">
                        <a href="profile" class="dropdown-toggle">
                            <i class="glyphicon glyphicon-cog text-orange"></i>
                            <?php echo $_SESSION['name']; ?>
                        </a>
                    </li>

                    <li class="">
                       
                        <a href="logout" class="dropdown-toggle">
                            <i class="glyphicon glyphicon-off text-red"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

