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
    $exchange_id = $_POST['exchange_id'];

    function AmountInWords($amount) {
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
    $orderno = $_GET['order_no'];

    $query_cus = mysqli_query($con, "SELECT * FROM sales WHERE invoice_no='$orderno'  ") or die(mysqli_error($con));
    $row = mysqli_fetch_array($query_cus);
    $customer_id = $row['customer_id'];
    $invoiceDate = $row['date_added'];
    $order_shoprite = $row['order_shoprite'];
    $mode_payment = $row['modeofpayment'];
    $currency_id = $row['currency_id'];
    $payterm = 'Cash';
    $exchange_rate = $row['rate'];

    $invoice2 = mysqli_query($con, "SELECT MAX(id) AS id FROM invoices_tb") or die(mysqli_error($con));
    $rowss = mysqli_fetch_array($invoice2);
    $invoiceNo = $rowss['id'];

    $customer = mysqli_query($con, "SELECT * FROM `customer` WHERE cust_id ='$customer_id' ") or die(mysqli_error($con));

//echo '$customer_id '.$customer_id;

    $customerRows = mysqli_fetch_array($customer);
    $tpin = $customerRows['tpin'];
    $acc = $customerRows['Account_Number'];
    $id = $_GET['id'];
    ?>

    <center>
        <a class="btn btn-success btn-print" href="" onclick="window.print()"><i class="glyphicon glyphicon-print"></i> Print</a>
        <a class="btn btn-lg btn-warning" href="javascript:void(0);" onclick="window.history.back();">Back</a>
    </center>
    <br></br>

    <head>
        <meta charset="utf-8">
        <title>Receipt</title>
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
                /* page-break-inside: avoid; */
            }

            table tr th {
                font-weight: bold !important;
            }
            .footer {
                margin-top: 30%;

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

        span {
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
            margin-top: 38%;
            position: relative;
        }

        .table-data {
            width: 100%;
            /* height: 32rem; */
            height: auto;
            /* border: 2px solid black; */

        }

        .sign {
            margin-top: 10rem;
            position: absolute;
        }

        table{
            border-collapse: separate;
            border-spacing: 0;
        }

    </style>

    <body onload="window.print()">
        <header>
            <div style="display: flex; width: 100%; text-align: left; justify-content: left">
                <div style=" margin-top: -29px;margin-left:-20px">
                    <img src="reciept.png" />
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
                                <div>DOCUMENT NO : <?php echo $invoiceNo; ?> </div>

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
                                <div>CURRENCY : <?php echo $currency_id ?></div>
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


            <table style="" class="thead">
                <thead>
                    <tr>

                        <th class="qt" style="border:1px solid black; border-bottom:0; border-right:0;">ACCOUNT</th>
                        <th class="qt" style="border:1px solid black;border-bottom:0; border-right:0;">TERMINAL</th>
                        <th class="qt" style="border:1px solid black;border-bottom:0; border-right:0;">EXCHANGE RATE</th>

                        <th class="qt" style="border:1px solid black;border-bottom:0; border-right:0;">LPO NO.</th>

                        <th class="qt" style="border:1px solid black;border-bottom:0; border-right:0;"> PAYMENT TERMS.</th>
                        <th class="qt" style="border:1px solid black;"> CUSTOMER TPIN.</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="border:1px solid black;border-right:0;"><?php echo $acc ?></td>
                        <td style="border:1px solid black;border-right:0;">Master Warehouse</td>
                        <td style="border:1px solid black;border-right:0;"><?php echo $exchange_rate; ?></td>
                        <td style="border:1px solid black; border-right:0;"> <?php echo $order_shoprite; ?></td>

                        <td style="border:1px solid black;border-right:0;"> <?php echo $payterm; ?> </td>
                        <td style="border: 1px solid black;border-top:0;">
                            <?php
                            if (empty($tpin)) {
                                echo 'N/A';
                            } else {
                                echo $tpin;
                            }
                            ?>
                        </td>

                    </tr>
                </tbody>
            </table>
            <br><br>

            <div class="table-data">
                <table border="1" style="border:1px 1px solid black;" class="">
                    <thead>
                        <tr>

                            <th class="per" style="border:1px solid black; border-right:0"">QUANTITY</th>
                            <th class="dis" style="border:1px solid black;  width:25rem; border-right:0"">DESCRIPTION</th>

                            <th class="per" style="border:1px solid black; border-right:0"">UNIT PRICE</th>
                            <th class="per" style="border:1px solid black;">TOTAL</th>

                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        
                        $query_ = mysqli_query($con, "SELECT sales_details.description, sales_details.price,sales_details.qty,sales.* FROM sales INNER JOIN sales_details ON sales.sales_id = sales_details.sales_id WHERE sales.sales_id='$id' ") or die(mysqli_error($con));

                        $row_ = mysqli_fetch_array($query_);

                        $sales_id = $row_['sales_id'];
                        $sid = $row_['sales_id'];
                        
                        $discount = $row_['discount'];
                        $totalDiscount = 0;
                        $query2 = mysqli_query($con, "select * from sales_details LEFT join product on product.prod_id=sales_details.prod_id where sales_id='$sid'") or die(mysqli_error($con));

                        // echo "SELECT * FROM `sales` INNER JOIN modes_of_payment_tb on modes_of_payment_tb.payment_mode_id=sales.modeofpayment WHERE sales_id = (SELECT MAX(sales_id) FROM sales WHERE user_id='$id' ) AND user_id='$id'  ";
                        while ($row = mysqli_fetch_array($query2)) {
                            $order_no = $row['invoice_no'];
                            $count++;
                            // $excInc = $row['Exc/Inc'];

                            if ($row['prod_name'] == '') {
                                $prodName = $row['description'];
                            } else {
                                $prodName = $row['prod_name'];
                            }
                            $excInc = 'Inclusive';

                            $price = $row['price'];
                            $total = $row['qty'] * $row['price'];

                            $qty = $row['qty'];
                            $amount = $row['amount'];
                            $discount_type = $row['discount_type'];

                            //$unitPrice = $row['price'] / $row['qty'];
                            //$grand = $grand + $total;
                            $totalDiscount += $newPrice;

                            $grand = $grand + $total;
                            $currency_symbols = [
                                'ZMW' => 'K',
                                'USD (Dollar)' => '$',
                                'UK (Pound)' => '£',
                            ];

                            $currency_symbol = isset($currency_symbols[$currency_id]) ? $currency_symbols[$currency_id] : '';
                            $formatted_total = $currency_symbol . ' ' . number_format($total, 2);
                            $formatted_price = $currency_symbol . ' ' . number_format($price, 2);

                            $subTotal_ += $row['qty'] * $row['price'];

                            echo ' <tr>
                                        <td style="border:1px solid black;border-right:0; border-top:0;">  N/A   </td>
                                        <td style="border:1px solid black; border-right:0; border-top:0;">' . $prodName . '</td>
                                        <td style="border:1px solid black; border-right:0; border-top:0;">' . $formatted_price . '</td>
                                        <td style="border:1px solid black; border-top:0;">' . $formatted_total . '</td>
                                        </tr>';
                        }




                        $Partpaymentsquery = mysqli_query($con, "SELECT SUM(amount) AS amount FROM `part_payments_tb` INNER JOIN user ON user.user_id=part_payments_tb.user_id AND order_no='$orderno' GROUP BY order_no") or die(mysqli_error($con));
                        $grand = 0;

                        $pppaymentsrow = mysqli_fetch_array($Partpaymentsquery);

                        $subTotal += ($subTotal_ - $discount) / 1.16;
                        $totalVatAmountonsider = $subTotal_ - ($subTotal_ - $discount) / 1.16;
                        echo ' <tr>                    
                    <td style=""> </td>
                    <td style="text-align:start;"></td>
                    <td style="">SUB TOTAL</td>
                    <td style="border: 1px solid black; border-top: 0;">' . $currency_symbol . ' ' . number_format($subTotal, 2) . '</td>
                    </tr>';

                        echo ' <tr>
                    <td style=""></td>
                    <td style="text-align:start;"> </td>
                    <td style="">VAT @ 16%</td>
                   
                    <td style="border:1px solid black; border-top:0;">' . $currency_symbol . '' . number_format($totalVatAmountonsider,2) . '</td>
                    </tr>';

                        $fin_total = ($subTotal_less - $discount) + $totalVatAmountonsider;
                        $formatted_fin_total = $currency_symbol . ' ' . number_format($fin_total, 2);
                        echo ' <tr>
                                            <td style=""></td>
                                            <td style="text-align:start;"> </td>
                                            <td style="">TOTAL</td>
                                           
                                            <td style="border:1px solid black; border-top:0;">' . $currency_symbol . '' . number_format(($subTotal - $discount) + $totalVatAmountonsider, 2) . '</td>
                                            </tr>';
                        ;
                        ?>
                    </tbody>
                </table>
          

            </div>
            
        </div>
    </div>

</article>

</body>



</html>