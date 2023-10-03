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

<style>
    .navbar-brand {
        margin: 1rem;
        background-color: #3c8d !important;
        border-radius: 5%;
        color: black !important;
        font-size: small;

    }

    .main-header .navbar {
        display: flex !important;
        background: rgba(0, 0, 0, 0.0) !important;
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
    <nav class="navbar navbar-static-top">
        <div class="container-fluid">
            <div class="navbar-header" style="padding-left:20px">
                <a href="home.php" class="navbar-brand"><b><i class="glyphicon glyphicon-home"></i> <?php
                                                                                                    echo $branch_name;
                                                                                                    ?></b></a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <i class="fa fa-bars"></i>
                </button>
            </div>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown notifications-user">
                        <a href="home">
                            <i class="glyphicon glyphicon-home text-green"></i> Home
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                            </li>
                        </ul>
                    </li>

                    <!-- <li class="dropdown notifications-menu">
                        <a href="expenses">
                            <i class="glyphicon glyphicon-shopping-cart text-green"></i> Expenses

                        </a>
                        <ul class="dropdown-menu">
                            <li>
                            </li>
                        </ul>
                    </li> -->

                    <li class="dropdown notifications-menu">
                        <a href="product-shortages">
                            <i class="glyphicon glyphicon-alert text-green"></i>
                            <?php
                            $query3 = mysqli_query($con, "SELECT COUNT(prod_id) AS prodcount FROM product WHERE prod_qty <=(SELECT notification_count FROM branch)") or die(mysqli_error($con));
                            $row3 = mysqli_fetch_array($query3);
                            if (mysqli_num_rows($query3) > 0) {
                                echo " ( " . $row3['prodcount'] . " ) ";
                            }
                            ?>
                            Noti
                        </a>

                    </li>

                    <li class="dropdown notifications-menu">
                        <a href="quotation">
                            <i class="glyphicon glyphicon-shopping-cart text-green"></i> Quotation

                        </a>
                        <ul class="dropdown-menu">
                            <li>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown notifications-menu">
                        <a href="draft-sale">
                            <i class="glyphicon glyphicon-shopping-cart text-green"></i> Invoices
                            <?php
                            $query3 = mysqli_query($con, "SELECT COUNT( DISTINCT temp_trans_id) AS prodcount FROM `draft_temp_trans`") or die(mysqli_error($con));
                            $row3 = mysqli_fetch_array($query3);
                            echo " ( " . $row3['prodcount'] . " ) ";
                            ?>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown notifications-menu">
                        <!-- Menu toggle button -->
                        <a href="recieve_payment">
                            <i class="glyphicon glyphicon-shopping-cart text-green"></i>Recieve Payments
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown notifications-menu">
                        <!-- Menu toggle button -->
                        <a href="sales_receipt">
                            <i class="glyphicon glyphicon-shopping-cart text-green"></i>Sales Receipt
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown notifications-menu">
                        <!-- Menu toggle button -->
                        <a href="credit_customer">
                            <i class="glyphicon glyphicon-shopping-cart text-green"></i> Credit Note
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                            </li>
                        </ul>
                    </li>

                    <!-- <li class="dropdown notifications-menu">
                        <a href="cashout-report">
                            <i class="glyphicon glyphicon-shopping-cart text-green"></i>Cash Out
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                            </li>
                        </ul>
                    </li> -->

                    <li class="">
                        <a href="../AdminPortal/home" class="dropdown-toggle">
                            <i class="glyphicon glyphicon-cog text-orange"></i>
                            Switch User Acc
                        </a>
                    </li>

                    <li class="">
                        <!-- Menu Toggle Button -->
                        <a href="logout" class="dropdown-toggle">

                            <i class="glyphicon glyphicon-off text-red"></i>

                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>