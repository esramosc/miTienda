<!DOCTYPE html>
<%
    def payments = 0.0
%>
<html>
    <head>
        <meta name="layout" content="main">
        <r:require module="export"/>
    </head>
    <body>
        <div class="row alert">
            <h3>Reporte de abonos de creditos de clientes</h3>
            <table class="table table-responsive table-bordered">
                <thead>
                <tr>

                    <th>Cliente</th>

                    <th>Monto Anterior</th>

                    <th>Abono</th>

                    <th>Monto actual</th>

                    <th>Fecha de abono</th>

                    <th>Usuario</th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${results}" status="i" var="res">
                    <tr class="${(i % 2) == 0 ? 'info' : 'active'}">

                        <td>${res.customerId}</td>

                        <td>${res.amount}</td>

                        <td>${res.payment}</td>

                        <td>${res.amount - res.payment}</td>

                        <td>${res.tranDate.format("dd/MM/yyyy HH:mm:ss")}</td>

                        <td>${res.username}</td>

                        <%
                            payments = payments + res.payment
                        %>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <div class="row alert alert-info">
            <div class="col-md-1">&nbsp;</div>
            <div class="col-md-5">
                <span style="font-size: 30px;font-weight: bold;font-style: italic;">Total de abonos: $ ${payments}</span>
            </div>
            <div class="col-md-5">
                <span style="font-size: 30px;font-weight: bold;font-style: italic;">Exportar datos a <export:formats formats="['excel']" action="export" class="btn btn-success"/></span>
            </div>
            <div class="col-md-1">&nbsp;</div>
        </div>
    </body>
</html>
