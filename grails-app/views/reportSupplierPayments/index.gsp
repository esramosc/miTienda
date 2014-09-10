<!DOCTYPE html>
<%
    def totalPayments = 0.0
%>
<html>
<head>
    <meta name="layout" content="main">
    <r:require module="export"/>
</head>
<body>
<div class="row alert">
    <h3>Reporte de los pagos del d&iacute;a a proveedores</h3>
    <table class="table table-responsive table-bordered">
        <thead>
        <tr>

            <th>Proveedor</th>

            <th>Monto anterior</th>

            <th>Pago</th>

            <th>Monto actual</th>

            <th>Usuario</th>

            <th>Fecha de transacci&oacute;n</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${result}" status="i" var="res">
            <tr class="${(i % 2) == 0 ? 'info' : 'active'}">

                <td>${res.supplierId}</td>

                <td>${res.actualAmount}</td>

                <td>${res.payment}</td>

                <td>${res.amount}</td>

                <td>${res.username}</td>

                <td>${res.registerDate}</td>

                <%
                    totalPayments = totalPayments + res.payment
                %>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="row alert alert-info">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-5">
        <span style="font-size: 30px;font-weight: bold;font-style: italic;">Total de pagos: $ ${totalPayments}</span>
    </div>
    <div class="col-md-5">
        <span style="font-size: 30px;font-weight: bold;font-style: italic;">Exportar datos a <export:formats formats="['excel']" action="export" class="btn btn-success"/></span>
    </div>
    <div class="col-md-1">&nbsp;</div>
</div>
</body>
</html>
