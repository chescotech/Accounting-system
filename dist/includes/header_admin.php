<?php
//session_start();
if (empty($_SESSION['id'])) :
    header('Location:../index.php');
endif;
date_default_timezone_set("Africa/Lusaka");
?>
<?php
include('../dist/includes/dbcon.php');
include_once('Classes/Group.php');

$GroupObject = new Group($con);

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

<?php
$groupID = $_SESSION['group'];
$userGroup = $GroupObject->getGroupPermissions($groupID);
$permissions = mysqli_fetch_assoc($userGroup);
?>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
    .navbar-brand {
        background-color: #3c8d !important;
        color: black !important;
        font-size: smaller;
    }

    .main-header .navbar {
        display: flex !important;
        background: rgba(0, 0, 0, 0.8) !important;
        /* background: rgb(255,255,120,0.9) !important; */
        color: white;
        border-bottom: 3px solid #3c8d;
        border-top: 3px solid #3c8d;
    }

    .main-header .navbar li {
        color: white;
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
    <nav class="navbar navbar-static-top">
        <div class="container-fluid">
            <div class="navbar-header" style="padding-left:20px">
                <a href="home.php" class="navbar-brand"><b><i class="glyphicon glyphicon-home"></i> <?php echo $branch_name; ?> </b></a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <i class="fa fa-bars"></i>
                </button>
            </div>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown notifications-user">
                        <a href="home.php">
                            <i class="glyphicon glyphicon-home text-green"></i> Home
                        </a>
                    </li>
                    <li class="dropdown notifications-menu" style="display: <?php echo $permissions['setup'] == 'false' ? 'none' : '' ?>;">
                        <a id="setup" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-wrench"></i> Setup
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">
                                    <li>
                                        <a href="company-setup">
                                            <i class="glyphicon glyphicon-user text-green"> Company Setup</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="sales_pay_setup">
                                            <i class="glyphicon glyphicon-user text-green"> Sales Pay Setup</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="branch-setup">
                                            <i class="glyphicon glyphicon-user text-green"> Branch Setup</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="manage-warehouses">
                                            <i class="glyphicon glyphicon-user text-green"> Warehouses Setup</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="cashout-limits">
                                            <i class="glyphicon glyphicon-scissors text-green"> Cashout Limits</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="modes-of-payment">
                                            <i class="glyphicon glyphicon-user text-green"> Payment Modes</i>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="category">
                                            <i class="glyphicon glyphicon-user text-green"></i> Item Categories
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="supplier.php">
                                            <i class="glyphicon glyphicon-send text-green"></i> Suppliers
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="supplier_payments">
                                            <i class="glyphicon glyphicon-send text-green"></i> Supplier Payments
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="expenses">
                                            <i class="glyphicon glyphicon-send text-green"></i> Expenses
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="expense_types">
                                            <i class="glyphicon glyphicon-send text-green"></i> Expense Types
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="customer">
                                            <i class="glyphicon glyphicon-send text-green"></i> Customers
                                        </a>
                                    </li>

                                    <li><!-- start notification -->
                                        <a href="inventory-list">
                                            <i class="glyphicon glyphicon-send text-green"></i> Inventory Records
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown notifications-user" style="display: <?php echo $permissions['expenses'] == 'false' ? 'none' : '' ?>;">
                        <a href="expenses">
                            <i class="glyphicon glyphicon-user text-green"></i> Expenses
                        </a>
                        <ul class="dropdown-menu">
                        </ul>
                    </li>



                    <li class="dropdown notifications-menu" style="display: <?php echo $permissions['customer'] == 'false' ? 'none' : '' ?>;">
                        <a id="stock" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-wrench"></i> Customer
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">

                                    <li>
                                        <a href="../user/draft-sale">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Invoices
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../user/quotation.php">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Quotation
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../user/sales_receipt_draft.php">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Sales Reciept
                                        </a>
                                    </li>

                                    <li >
                                        <a href="../user/credit_draft">
                                            <i class="glyphicon glyphicon-user text-green"></i> credit Note
                                        </a>
                                    </li>

                                    <li>
                                        <a href="../user/recieve_payment.php">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Recieve Payments
                                        </a>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                    </li>


                    <li class="dropdown notifications-menu" style="display: <?php echo $permissions['stock'] == 'false' ? 'none' : '' ?>;">
                        <a id="stock" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-wrench"></i> Stock
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">

                                    <li>
                                        <a href="product">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Manage Products
                                        </a>
                                    </li>

                                    <li>
                                        <a href="transfer_select.php">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Purchase Stock
                                        </a>
                                    </li>

                                    <li>
                                        <a href="bulk-entry">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Bulk Upload
                                        </a>
                                    </li>

                                    <li>
                                        <a href="ware-house-stock">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Manage Warehouse Stock
                                        </a>
                                    </li>

                                    <li>
                                        <a href="input-reversal">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Manage Reversal
                                        </a>
                                    </li>

                                    <li>
                                        <a href="input-invoiceno">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Credit Note
                                        </a>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown notifications-user" style="display: <?php echo $permissions['users'] == 'false' ? 'none' : '' ?>;">
                        <a href="users">
                            <i class="glyphicon glyphicon-user text-green"></i> Users
                        </a>
                        <ul class="dropdown-menu">

                        </ul>
                    </li>

                    <li class="dropdown notifications-menu" style="display: <?php echo $permissions['groups'] == 'false' ? 'none' : '' ?>;">
                        <a id="groups" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-wrench"></i> Groups
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">
                                    <li>
                                        <a href="groups-add.php">
                                            <i class="glyphicon glyphicon-plus text-info"></i> Add Groups
                                        </a>
                                    </li>
                                    <li>
                                        <a href="groups-manage.php">
                                            <i class="glyphicon glyphicon-plus text-info"></i> View Groups
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown notifications-user" style="display: <?php echo $permissions['cash_flow'] == 'false' ? 'none' : '' ?>;">
                        <a href="bank_module.php">
                            <i class="glyphicon glyphicon-stats text-green"></i> Bank Module
                        </a>
                        <ul class="dropdown-menu">

                        </ul>
                    </li>

                    <li class="dropdown notifications-menu" style="display: <?php echo $permissions['accounts'] == 'false' ? 'none' : '' ?>;">
                        <a id="reports" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-stats"></i> Accounts
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">
                                    <li>
                                        <a href="accountschart.php">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Chart of Accounts
                                        </a>
                                    </li>
                                    <li>
                                        <a href="general_ledger.php">
                                            <i class="glyphicon glyphicon-stats text-green"></i> General Ledger
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>


                    <li class="dropdown notifications-menu" style="display: <?php echo $permissions['reports'] == 'false' ? 'none' : '' ?>;">
                        <a id="reports" href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-stats"></i> Reports
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <ul class="menu">
                                    <li>
                                        <a href="userauditreport">
                                            <i class="glyphicon glyphicon-stats text-green"></i> User Audits
                                        </a>
                                    </li>
                                    <li>
                                        <a href="product-shortages">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Product Shortages
                                        </a>
                                    </li>
                                    <li>
                                        <a href="supplier-payments-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Supplier Payments Report
                                        </a>
                                    </li>
                                    <li>
                                        <a href="sales-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Sales Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="customer-invoices">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Customer Invoices Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="transaction-history">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Transaction History Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="product-expiry-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Product Expiry Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="part-payments-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Part Payments Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="advance-payments">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Advance Payments Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="expenses-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Expenses Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="profit-loss-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Profit Loss Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="stock-transfer-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Stock Transfer Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="open-close-cash-out-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Open Close Cash Out Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="user-cash-out-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> User Cash Out Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="ware-house-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Warehouse Count Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="stock-count">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Stock Count Report
                                        </a>
                                    </li>


                                    <li>
                                        <a href="discounts-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Discounts Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="stock-damages-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Damages Report
                                        </a>
                                    </li>



                                    <li>
                                        <a href="stock-audits-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Stock Audit Report
                                        </a>
                                    </li>

                                    <li>
                                        <a href="draft-sales-report">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Credit Sales
                                        </a>
                                    </li>
                                    <li>
                                        <a href="open-close-balances">
                                            <i class="glyphicon glyphicon-stats text-green"></i> Balances Report
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!-- 
                    <li class="">
                        <a href="../user/home" class="dropdown-toggle">
                            <i class="glyphicon glyphicon-cog text-orange"></i>
                            Switch User Acc
                        </a>
                    </li> -->
                    <!-- <li class="">
                        <a href="profile" class="dropdown-toggle">
                            <i class="glyphicon glyphicon-cog text-orange"></i>
                            <?php echo $_SESSION['name']; ?>
                        </a>
                    </li> -->

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