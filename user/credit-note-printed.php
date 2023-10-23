<!DOCTYPE html>
<!-- partial:index.partial.html -->
<?php include('../dist/includes/dbcon.php'); ?>
<html>


<?php
error_reporting(0);
session_start();

include('Classes/Company.php');
$company = new Company();
?>
<?php
$id = $_SESSION['id'];
$queryb = mysqli_query($con, "select * from branch") or die(mysqli_error($con));
$rowb = mysqli_fetch_array($queryb);

function AmountInWords($amount)
{
    $amount_after_decimal = round($amount - ($num = floor($amount)), 2) * 100;
    // Check if there is any number after decimal
    $amt_hundred = null;
    $count_length = strlen($num);
    $x = 0;
    $string = array();
    $change_words = array(
        0 => '', 1 => 'One', 2 => 'Two',
        3 => 'Three', 4 => 'Four', 5 => 'Five', 6 => 'Six',
        7 => 'Seven', 8 => 'Eight', 9 => 'Nine',
        10 => 'Ten', 11 => 'Eleven', 12 => 'Twelve',
        13 => 'Thirteen', 14 => 'Fourteen', 15 => 'Fifteen',
        16 => 'Sixteen', 17 => 'Seventeen', 18 => 'Eighteen',
        19 => 'Nineteen', 20 => 'Twenty', 30 => 'Thirty',
        40 => 'Forty', 50 => 'Fifty', 60 => 'Sixty',
        70 => 'Seventy', 80 => 'Eighty', 90 => 'Ninety'
    );
    $here_digits = array('', 'Hundred', 'Thousand', 'Lakh', 'Crore');
    while ($x < $count_length) {
        $get_divider = ($x == 2) ? 10 : 100;
        $amount = floor($num % $get_divider);
        $num = floor($num / $get_divider);
        $x += $get_divider == 10 ? 1 : 2;
        if ($amount) {
            $add_plural = (($counter = count($string)) && $amount > 9) ? 's' : null;
            $amt_hundred = ($counter == 1 && $string[0]) ? ' and ' : null;
            $string[] = ($amount < 21) ? $change_words[$amount] . ' ' . $here_digits[$counter] . $add_plural . ' 
       ' . $amt_hundred : $change_words[floor($amount / 10) * 10] . ' ' . $change_words[$amount % 10] . ' 
       ' . $here_digits[$counter] . $add_plural . ' ' . $amt_hundred;
        } else
            $string[] = null;
    }
    $implode_to_Rupees = implode('', array_reverse($string));
    $get_paise = ($amount_after_decimal > 0) ? "And " . ($change_words[$amount_after_decimal / 10] . " 
   " . $change_words[$amount_after_decimal % 10]) . ' Paise' : '';
    return ($implode_to_Rupees ? $implode_to_Rupees . ' ' : '') . $get_paise;
}
?>


<?php
$branch = $_SESSION['branch'];
$orderno = $_GET['orderno'];
$credid = $_GET['id'];

$query_cus = mysqli_query($con, "SELECT * FROM `credit_note` where credit_note_number='$credid' ") or die(mysqli_error($con));
$row = mysqli_fetch_array($query_cus);
$customer_id = $row['Customer_id'];
$invoiceDate = $row['date'];
$mode_payment = $row['name'];
// $currency_id = $row['invoice_no'];
$currency_id = 'ZMW';
$credit_note_number = $row['credit_note_number'];

// add the credit note. 

// $inv = mysqli_query($con, "update draft_temp_trans set credit_note='Yes' where order_no='$orderno'  ") or die(mysqli_error($con));
$rowi = mysqli_fetch_array($query_cus);
// $excInc = $rowi['Exc/Inc'];
$excInc = 'Inclusive';

$invoice2 = mysqli_query($con, "SELECT MAX(id) AS id FROM invoices_tb") or die(mysqli_error($con));
$rowss = mysqli_fetch_array($inv);
$invoiceNo = $rowss['id'];

$query2 = mysqli_query($con, "SELECT * FROM draft_temp_trans WHERE branch_id='$branch' AND order_no = '$orderno'") or die(mysqli_error($con));

while ($row = mysqli_fetch_array($query2)) { 
    $currency_id = $row['currency_id'];  

}


$customer = mysqli_query($con, "SELECT * FROM `customer` WHERE cust_id ='$customer_id' ") or die(mysqli_error($con));

//echo '$customer_id '.$customer_id;

$customerRows = mysqli_fetch_array($customer);
$cust_id = $customerRows['cust_id'];
?>

<center>
    <a class="btn btn-success btn-print" href="" onclick="window.print()"><i class="glyphicon glyphicon-print"></i> Print</a>
    <a class="btn btn-primary btn-print" href="javascript:void(0);" onclick="window.history.back();">
  <i class="glyphicon glyphicon-arrow-left"></i> | Back
</a>

</center>
<br></br>

<head>
    <meta charset="utf-8">
    <title>Credit Note</title>
    <link rel="stylesheet" href="style.css">

</head>
<style type="text/css">
    @media print {
        .btn-print {
            display: none !important;
        }

        body {
            width: 20cm;
            height: auto;
            /* height: 28cm; */
            margin: 0;
            padding: 1;
        }

        @page {
            size: A4;
            margin: 0;
        }

        .container {
            width: 100%;
            padding: 0;
            margin: 0;
        }

        table {
            page-break-inside: avoid;
        }

        table tr th {
            font-weight: bold !important;
        }




        table .table-data {
            border-collapse: collapse !important;
            border: 1px 1px solid black !important;
        }



        table .table-data tr {
            border: 1px solid black !important;
        }

        th {

            /* Adjust the background color as needed */
        }

    }


    body {
        font-family: "Century Gothic", sans-serif;
        box-sizing: unset !important;

    }

    table tr th {
        font-weight: bold !important;
        text-align: center;
    }

    table tr td {
        text-align: center;
    }

    .bank span {
        color: blue;
        font-weight: bold;
    }

    .topHeaderTable th {
        display: flex;
        font-weight: lighter !important;
    }

    .TopAddress {
        margin-top: -15px;
    }

    .bank_details {

        padding-bottom: 5px;
        border: 1px solid black;
        padding: 5px;
        line-height: 1.5rem;
        font-size: 11px;
    }

    .footer {
        width: 100%;
        height: 10rem;
        margin-top: 20%;
        position: relative;
    }

    .table-data {
        width: 100%;
        /* height: 32rem; */
        height: auto;
        /* border: 2px solid black; */

    }

    .sign {
        margin-top: 4rem;
        position: absolute;
    }
    table{
        border-collapse: separate;
        border-spacing: 0;
    }
</style>

<body onload="window.print()">
    <header>
        <div style="display: flex; width: 100%;  text-align: left; justify-content: left">
            <div style=" margin-top: -29px;margin-left:-20px">
                <img src="credit_note.png" />
                <p style="margin-left: 1.8rem ; font-weight:bold;"> MOBILE MONSTERS</p>

            </div>

        </div>

    </header>
    <article>

        <div class="TopAddress">
            <div style="border: none; border-right; width:40%; padding: 10px;margin-top:5px;">
                <div style="display:flex; justify-content:space-between;">
                    <div style="padding-bottom: 4; 10px;margin-top:-8px">
                        <p style="font-size: 12px; margin-bottom:0.4rem; "> SHOP NUMBER 1 </p>
                        <p style="font-size: 12px; margin-bottom:0.4rem;"> <?php echo $company->address($con); ?></p>
                        <p style="font-size: 12px; margin-bottom:0.4rem;"> LUSAKA , ZAMBIA - 0978610611 / 0971648860 </p>
                        <p style="font-size: 12px; text-decoration:underline;"> <?php echo $company->contact($con); ?></p>
                        <br />
                    </div>
                </div>

                <br><br><br>

                <div style="display:flex; justify-content:space-between;">
                    <div style="padding-bottom: 5xp;margin-top:-12px">
                        <p style="text-decoration:underline; font-weight:bold;">Customer Details: </p>
                        <br>
                        <p style="font-style: italic; color:blue; font-weight:bold;"><?php echo $customerRows['cust_first']; ?></p>
                    </div>
                </div>

            </div>



            <div style="border: none; width:60% ;margin-right:-100px">
                <table class="topHeaderTable" style="width: 100%; text-align:start;">
                    <tr>
                        <th>
                            <div>CREDIT NOTE NO : <?php echo $credit_note_number; ?></div>

                        </th>

                    </tr>
                    <tr>
                        <th>
                            <div>DATE: <?php echo date("l, j F Y"); ?></div>
                            <div style="font-weight: bold; padding-top: 5px;">
                            </div>
                        </th>

                    </tr>
                    <tr>
                        <th>
                            <div>TPIN : 1001086491</div>
                        </th>

                    </tr>

                    <tr>
                        <th>
                            <!-- <div>CURRENCY : <?php echo $currency_id ?></div> -->
<br>
                        </th>

                    </tr>

                </table>

                <div>
                    <div style="padding-top:20px;padding-left: 8px; margin-bottom:40px; border:none; margin-top:10px">
                        <p style="text-decoration:underline; font-weight:bold;">Customer Delivery Address: </p>
                        <br>
                        <p style="font-style: italic; color:blue; font-weight:bold;"> <?php echo $customerRows['cust_address'] . '  <br> ' . $customerRows['city']; ?> </p>
                    </div>
                </div>
            </div>
        </div>


        <table style="">

            <thead>
                <tr>

                    <th class="qt" style="border:1px solid black;border-bottom:0; border-right:0;">ACCOUNT</th>
                    <th class="qt" style="border:1px solid black;border-bottom:0; border-right:0;"> BRANCH CODE</th>

                    <th class="qt" style="border:1px solid black;border-bottom:0; border-right:0;">ORDER NO</th>
                    <th class="qt" style="border:1px solid black;border-bottom:0; border-right:0;"> VENDOR NO</th>
                    <!-- <th class="qt" style="border:1px solid black;border-bottom:0; border-right:0;"> PAYMENT TERMS.</th> -->
                    <th class="qt" style="border:1px solid black;"> CUSTOMER TPIN.</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="border:1px solid black;border-right:0;"><?php echo $customerRows['Account_Number'] ?></td>
                    <td style="border:1px solid black;border-right:0;"><?php echo $customerRows['cust_contact'] ?></td>
                    <td style="border:1px solid black;border-right:0;"> <?php echo $orderno ?> </td>

                    <td style="border:1px solid black;border-right:0;"><?php echo $cust_id  ?></td>                    <!--<td style="border:1px solid black;border-right:0;"> </td> -->
                    <td style="border:1px solid black;border-top:0;"><?php echo $customerRows['tpin'] ?>
                    </td>
                </tr>
            </tbody>
        </table>
        <br><br>
        <div class="table-data">
            <table style="border:1px 1px solid black;">
                <thead>
                    <tr>
                        <th class="per" style="border:1px solid black;border-right:0">QUANTITY</th>
                        <th class="dis" style="border:1px solid black;border-right:0">DESCRIPTION</th>
                        <th class="per" style="border:1px solid black;border-right:0">UNIT PRICE</th>
                        <th class="per" style="border:1px solid black;">TOTAL</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = mysqli_query($con, "SELECT * FROM `credit_note` WHERE credit_note_number='$credid' ") or die(mysqli_error($con));
                    $grand = 0;
                    $grand = 0;
                    $grand = 0;
                    $totalDiscount = 0;

                    while ($row = mysqli_fetch_array($query)) {
                        $order_no = $row['order_no'];
                        $count++;

                        $prodName = $row['description'];

                        if ($excInc === "Exclusive") {
                            $price = $row['price'];
                            $total = $row['qty'] * $row['price'];

                            $subTotal_ += $row['qty'] * $price;

                            $pack_size = $row['pack_size'];
                        } elseif ($excInc === "Inclusive") {
                            $price = ($row['price']) / (1.16);
                            $total = ($row['qty'] * $row['price']) / (1.16);

                            $subTotal_ += $row['qty'] * $price;

                            $pack_size = $row['pack_size'];
                        }

                        $subTotal += $row['qty'] * $row['price'];
                        $amount = $row['amount'];
                        $discount_type = $row['discount_type'];
                        if ($amount != "") {
                            if ($discount_type == "Percentage") {
                                $newPrice = ($amount / 100) * ($row['prod_sell_price'] * $row['qty']);
                                //$newPrice = $price - $computedPrice;
                            } else {
                                $newPrice = $amount;
                            }
                            $total_ = ($row['prod_sell_price'] * $row['qty']) - $newPrice;
                        } else {
                            $total_ = ($row['prod_sell_price'] * $row['qty']);
                        }

                        //$unitPrice = $row['price'] / $row['qty'];
                        //$grand = $grand + $total;
                        $totalDiscount += $newPrice;

                        $grand = $grand + $total;

                        $currency_symbols = [
                            0 => 'K',
                            'ZMW' => 'K',
                            'USD (Dollar)' => '$',
                            'UK (Pound)' => '£',
                        ];

                        $currency_symbol = isset($currency_symbols[$currency_id]) ? $currency_symbols[$currency_id] : '';
                        $formatted_total = $currency_symbol . ' ' . number_format($total, 2);
                        $formatted_price = $currency_symbol . ' ' . number_format($price, 2);

                        echo ' <tr>
                                        <td style="border:1px solid black;border-right:0; border-top:0;">' . $row['qty'] . '</td>
                                        <td style="border:1px solid black;border-right:0; border-top:0;">' . $prodName . '</td>
                                        <td style="border:1px solid black; border-right:0; border-top:0;">' . $formatted_price . '</td>
                                       
                                        <td style="border:1px solid black; border-top:0;">' . $formatted_total . '</td>
                                        </tr>';
                    }

                    $amountLessVat = ($vatFinalTotal / 1.16);
                    $vatValue = $vatFinalTotal - $amountLessVat;

                    $subTotal += ($subTotal_ - $discount) / 1.16;
                    $totalVatAmountonsider = $subTotal_ - ($subTotal_ - $discount) / 1.16;

                    $totalExlVAT = $vatFinalTotal - $vatValue;

                    $Partpaymentsquery = mysqli_query($con, "UPDATE credit_note SET is_printed='Yes' where is_printed=''   ") or die(mysqli_error($con));
                    $grand = 0;

                    $pppaymentsrow = mysqli_fetch_array($Partpaymentsquery);

                    if ($excInc === "Exclusive") {
                        // Exclusive VAT calculation
                        $amountLessVat = $vatFinalTotal;
                        $vatValue = 0;
                        $subTotal_less = $subTotal_;

                        $totalVatAmountonsider = 0;

                        $totalExlVAT = $vatFinalTotal;
                    } elseif ($excInc === "Inclusive") {
                        // Inclusive VAT calculation
                        $amountLessVat = $vatFinalTotal / 1.16;
                        $vatValue = $vatFinalTotal - $amountLessVat;
                        $subTotal_less = $subTotal_;

                        $totalVatAmountonsider = ($subTotal_ * 1.16) - $subTotal_;

                        $totalExlVAT = $vatFinalTotal - $vatValue;
                    }

                    $formatted_subTotal = $currency_symbol . ' ' . number_format($subTotal_less, 2);
                    $formatted_vat = $currency_symbol . ' ' . number_format($totalVatAmountonsider, 2);

                    echo ' <tr>
                                        <td style=""></td>
                                        <td style=""></td>
                                        <td style="">SUB TOTAL</td>
                                       
                                        <td style="border:1px solid black; border-top:0;">' . $formatted_subTotal . '</td>
                                        </tr>';

                    echo ' <tr>
                                        <td style=""></td>
                                        <td style=""></td>
                                        <td style="">VAT @ 16%</td>
                                       
                                        <td style="border:1px solid black; border-top:0;">' . $formatted_vat . '</td>
                                        </tr>';

                    $fin_total = ($subTotal_less - $discount) + $totalVatAmountonsider;
                    $formatted_fin_total = $currency_symbol . ' ' . number_format($fin_total, 2);

                    echo ' <tr>
                                        <td style=""></td>
                                        <td style=""></td>
                                        <td style="">TOTAL</td>
                                       
                                        <td style="border:1px solid black; border-top:0;">' . $formatted_fin_total . '</td>
                                        </tr>';
                    ?>
                </tbody>
            </table>

            <div class="sign">
                <div style="display:flex; justify-content: start; justify-item:start;">

                    <div style="padding-left: 10px; padding-right: 10px; padding-top: 0px; height:100px">
                        <div style="border:none; border-top: 1px solid #3b3b3b; width:10rem;">
                            <div style="font-size: 11px; padding:0.5rem; line-height:1.2rem; text-align:center;">
                                Mobile Monsters <br> Authorised Signatory
                            </div>
                        </div>
                    </div>

                    <div style="border:none; border-top: 1px solid #3b3b3b; width:10rem; margin-left:5rem;">
                        <div style="font-size: 11px; padding:0.5rem; line-height:1.2rem; text-align:center; width:134%; margin-left:-34px;">
                            Checked & Received in Good Order By:<br> Authorised Signatory
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>

        <div class="footer">
            <footer style="margin:1rem 0px 0px 0px; position:sticky;">
                <p style="font-size: 9px;"> <?php echo $company->footer($con); ?> </p>
            </footer>

        </div>

    </article>

</body>

</html>