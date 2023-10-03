<?php
session_start();
if (empty($_SESSION['id'])) :
    header('Location:../index.php');
endif;
if (empty($_SESSION['branch'])) :
    header('Location:../index.php');
endif;
?>

<?php require './Reports.php' ?>



<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home | <?php include('../dist/includes/title.php'); ?></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../plugins/select2/select2.min.css">
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root {
            --chart-label-color: #333;
            --chart-background-color: rgba(0, 0, 0, 0.5);
            --chart-data-colors: 'rgba(255, 99, 132, 0.7)', 'rgba(54, 162, 235, 0.7)', 'rgba(75, 192, 192, 0.7)';
        }


        .col-sm-3 {
            margin: 1.5rem;
            height: 35rem;
            /* border: 2px solid black; */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .container-fluid {
            width: 122vw;
        }

        .card {
            max-height: 12px !important;
            position: relative;
        }

        .row {
            margin: 4rem;
        }

        .stats {
            max-height: 200px;
            /* Set a maximum height for the scrollable area */
            overflow-y: auto;
            /* Add vertical scroll if content overflows */
        }

        .th {
            line-height: 3em;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .tm {
            line-height: 1.4em;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .graph {

            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            position: relative;


        }

        .graph .diagram {
            flex-direction: column;
            background-color: transparent;
            justify-content: space-evenly;
        }

        .graph .diagram p {
            visibility: hidden;
        }


        .graph .stats {
            margin: 1rem 0 0 0.0rem;
            padding: 1rem 0 1rem 0;
        }

        .graph .stats p {

            padding: 0.2rem;
            position: relative;
        }


        .graph .stats .box {
            background: rgba(255, 99, 132, 0.7);
        }

        .box2 {
            background: rgba(54, 162, 235, 0.7);
        }

        .box3 {
            background: rgba(75, 192, 192, 0.7);
        }

        .graph .stats p b {
            width: 2rem;
            height: 4rem
        }

        .stats b {
            margin: ;
        }

        #myChart {
            width: 48% !important;
            height: fit !important;
            position: relative;
        }

        .doughout {
            width: 50% !important;
            height: fit !important;
            position: relative;
            margin-left: auto;
            margin-right: auto;
        }

        .boxes {
            margin-top: 2.8em !important;
            height: fit-content;
        }

          .legend{            
            margin-right: 0.5em;
            display: inline-flex;
            width: 10px;
            height: 10px;
            background: #9AD0F5;
            border:  1px solid black;
          }

          .legend2{            
            margin-right: 0.5em;
            display: inline-flex;
            width: 10px;
            height: 10px;
            background: #CC99BC;
            border:  1px solid black;
          }




    </style>
</head>


<body class="hold-transition skin-<?php echo $_SESSION['skin']; ?> layout-top-nav" onload="myFunction()">
    <div class="wrapper" style="background: white;">
        <?php include('../dist/includes/header_admin.php'); ?>
        <div class="container-fluid ">
 
            <div class="row">
                <div class="col-sm-18">
                    <div class="col-sm-3 col-xs-6">
                        <div class="card">
                            <div class="th">
                                <p><b>INCOME </b></p>
                                <p>Last Month </p>
                            </div>
                            <div class="graph">

                                <canvas id="myChart"></canvas>

                                <div class="stats">
                                <label><div class="legend"></div>Open invoice <b>K <?php echo number_format($totalAllDraft, 2, '.', ',') ?></b></label>
                                    <p></p>
                                    <label><div class="legend2"></div>Overdue invoices <b>K <?php echo number_format( $totalAllDraft2, 2, '.', ',' ) ?></b></label>                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <div class="card">
                            <div class="th">
                                <p><b>EXPENSES </b></p>
                                <p>Last Month </p>
                            </div>
                            <div class="SL">
                                <p><b>K <?php echo number_format($total, 2, '.', ',')?></b></p>
                                <label>Total for Last Month</label>
                            </div>
                            <div class="graph">
                                <div class="diagram doughout">
                                    <canvas id="myChart2"></canvas>
                                </div>
                                <!-- <div class="stats boxes">
                                    <?php foreach ($expenses as $expense) : ?>
                                        <p><b class="box" style="background-color: <?php echo $expense['color']; ?>"></b><?php echo $expense['description']; ?>: $<?php echo $expense['total_exp']; ?></p>
                                    <?php endforeach; ?>
                                </div> -->

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <div class="card">
                            <div class="th">
                                <p><b>PROFIT AND LOSS </b></p>
                                <p>Last Month </p>
                            </div>
                            <div class="SL">
                                
                                <label>Month Profit and loss report</label>
                            </div>
                            <div class="graph">

                                <div class="stats">
                                    
                                    <label>Income <b style="color: green;">K<?php echo number_format( $totalAllSales, 2, '.', ',') ?></b></label> <br> <br>
                                    
                                    <label>Expenses <b style="color: red;">K<?php echo number_format( $total, 2, '.', ',') ?></b></label>

                                </div>
                                
                            </div> <br>
                            <div class="SL">
                                <label>Month Net Income</label>
                                <p><b><?php echo $profitLossMessage; ?></b></p>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="col-sm-3 col-xs-6">
                        <div class="card" style="position:relative;">
                            <div class="th">
                                <p><b>BANK ACCOUNTS </b></p>
                                <p><a href="#"><i class="fa-solid fa-pen"></i></a></p>
                            </div>

                            <div class="tm">
                                <p><b>Revoult Account </b></p>
                                <p><a href="#"><b>K</b></a></p>
                            </div>
                            <div class="tm">
                                <p>Bank balance</p>
                                <p><a href="#"><b>K</b></a></p>
                            </div>
                            <div class="tm">
                                <p>in Moringa </p>
                                <p><a href="#"><b>K</b></a></p>
                            </div>
                            <p style="margin-top: 1em !important;"><b>Cash and Cash equivilants </b></p>
                            <div class="tm">
                                <p>in Moringa</p>
                                <p><a href="#"><b>K</b></a></p>
                            </div>

                            <div class="th" style="margin-top: 4.7em !important;">
                                <p>in Moringa </p>
                                <p><a href="#"><b>K</b></a></p>
                            </div>

                        </div>
                    </div> -->
                    <div class="col-sm-3 col-xs-6">
                        <div class="card">
                            <div class="th">
                                <p><b>SALES </b></p>
                                <p>Last Month </p>
                            </div>
                            <div class="tm">
                                <p><b>K <?php echo number_format( $totalAllSales, 2, '.', ',') ?> </b></p>

                            </div>
                            <div class="tm">
                                <p>Total for Last Month </p>

                            </div>
                            <div class="visual">
                                <div class="diagram">
                                    <canvas id="myChart3"></canvas>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php include('../dist/includes/footer.php'); ?>
    </div><!-- ./wrapper -->

    <script>         
         const invoice = <?php echo json_encode($invoice) ?>;
         const invoice2 = <?php echo json_encode($invoice2) ?>;
        const data = {
            labels: ['Category 1'],
            datasets: [{
                    label: 'Overdue Invoice',
                    data: invoice2.map(item => item.total),
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                    borderWidth: 0,
                    barPercentage: 0.4,
                    categoryPercentage: 0.5
                },
                {
                    label: 'Open invoice',
                    data: invoice.map(item => item.total),
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderWidth: 0,
                    barPercentage: 0.4,
                    categoryPercentage: 0.5
                }
            ]
        };

        const config = {
            type: 'bar',
            data: data,
            options: {
                indexAxis: 'x',
                scales: {
                    x: {
                        display: false,
                        stacked: true,
                        max: 100,
                        min: 0
                    },
                    y: {
                        display: false // Hide the y-axis
                    }

                },
                plugins: {
                    legend: {
                        display: false, // Hide the legend
                        position: 'bottom',
                        labels: {
                    boxWidth: 10, // Set the width of the legend color boxes
                    usePointStyle: true},


                    },
                    tooltip: {
                        enabled: true, // Disable tooltips
                        callbacks: {
                            label: function(context) {
                                return `${context.datasets}: ${context.parsed}%`;
                            }
                        }
                    }
                }
            }
        };

        const myChart = new Chart(document.getElementById('myChart').getContext('2d'), config);
    </script>

    <script>
        function randomColor(usedColors) {
            let newColor;
            do {
                const r = Math.floor(Math.random() * 256);
                const g = Math.floor(Math.random() * 256);
                const b = Math.floor(Math.random() * 256);
                newColor = `rgba(${r}, ${g}, ${b}, 0.7)`;
            } while (usedColors.includes(newColor));
            return newColor;
        }
        
        const expenses = <?php echo json_encode($expenses); ?>;

        const usedColors = [];
        expenses.forEach((item, index) => {
            if (!usedColors[index]) {
                usedColors[index] = randomColor(usedColors);
            }
        });
        
        const data2 = {
            labels: expenses.map(item => item.description),
            datasets: [{
                data: expenses.map(item => item.total_exp), // Values for the segments
                backgroundColor: usedColors
            }]
        };

        const config2 = {
            type: 'doughnut',
            data: data2,
            options: {
                cutout: '30%', // Adjust the size of the center hole
                responsive: true,
                plugins: {
                    legend: {
                        display: true, // Display the legend
                        position: 'bottom', // Position the legend at the bottom
                        labels: {
                    boxWidth: 10, // Set the width of the legend color boxes
                    usePointStyle: true // Use circle shape for legend color boxes
                }
                    },
                    tooltip: {
                        callbacks: {
                            label: (context) => {
                                const label = context.label;
                                const value = context.parsed;
                                return `${label}: K${value}`;
                            }
                        }
                    }
                }
            }
        };

        const myChart2 = new Chart(document.getElementById('myChart2'), config2);
    </script>

    <script>
         
        
        const sales = <?php echo json_encode($sales) ?>;
        const data3 = {
            labels: ['Day 1', 'Day 7', 'Day 14', 'Day 21', 'Day 30'],
            datasets: [{
                label: 'Dataset 1',
                data: sales.map(item => item.total),
                borderColor: 'rgba(255, 99, 132, 1)', // Line color
                backgroundColor: 'rgba(255, 99, 132, 0.2)' // Fill color under the line
            }]
        };

        const config3 = {
            type: 'line',
            data: data3,
            options: {
                responsive: true,
                scales: {
                    x: {
                        display: true, // Display the x-axis
                        title: {
                            display: true,
                            text: 'Last 30 days' // X-axis label
                        }
                    },
                    y: {
                        display: true, // Display the y-axis
                        title: {
                            display: true,
                            text: 'Amount Milestones' // Y-axis label
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: false, // Display the legend
                        position: 'top'
                    }
                }
            }

        };

        const myChart3 = new Chart(document.getElementById('myChart3'), config3);
    </script>

    <script type="text/javascript" src="autosum.js"></script>

    <!-- jQuery 2.1.4 -->
    <script src="../plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="../dist/js/jquery.min.js"></script>
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
    </script>    
</body>

</html>