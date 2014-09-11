<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <link href="${resource(dir:'css',file: 'chartStyle.css')}" rel="stylesheet"/>
        <script src="${resource(dir:'js',file: 'chartScript.js')}"></script>

    </head>
    <body>
        <div class="row alert">
            <h3 style="margin-left: 250px;">Resumen del d&iacute;a</h3>
            <div id="container">
                <canvas id="chart" width="500" height="500"></canvas>
                <table id="chartData">
                    <tr>
                        <th>Descripci&oacute;n</th>
                        <th>Monto</th>
                    </tr>
                    <tr style="color:#057249">
                        <td>Apertura de caja</td>
                        <td>${initCash}</td>
                    </tr>
                    <tr style="color:#0DA068">
                        <td>Ventas del d&iacute;a (Contado)</td>
                        <td>${todaySales}</td>
                    </tr>
                    <tr style="color:#ff33cc">
                        <td>Ventas del d&iacute;a (Credito)</td>
                        <td>${todaySalesCredit}</td>
                    </tr>
                    <tr style="color:#194E9C">
                        <td>Compras a proveedor de contado</td>
                        <td>${cashBuy}</td>
                    </tr>
                    <tr style="color:#ED9C13">
                        <td>Compras a proveedor a credito</td>
                        <td>${creditBuy}</td>
                    </tr>
                    <tr style="color:#ED5713">
                        <td>Pagos a proveedor</td>
                        <td>${todayPay}</td>
                    </tr>
                    <tr style="color:#0badff">
                        <td>Pagos de creditos de clientes</td>
                        <td>${creditPayments}</td>
                    </tr>
                </table>
            </div>
            <div style="margin-top: 580px;margin-left: 120px;">
                <a href="#" onclick="printScreen();" class="btn btn-lg btn-danger">Imprimir pantalla</a>
            </div>
        </div>
        <script type="text/javascript">
            $( document ).ready(function() {
                // Run the code when the DOM is ready
                $( pieChart );


            });
            function printScreen(){
                window.print();
            }
        </script>
    </body>
</html>
