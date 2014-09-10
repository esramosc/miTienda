<!DOCTYPE html>
<%
    def totalBuys = 0.0
    def totalCredit = 0.0
%>
<html>
<head>
    <meta name="layout" content="main">
    <r:require module="export"/>
</head>
<body>
<div class="row alert">
    <h3>Reporte de las compras del d&iacute;a a proveedores</h3>
    <table class="table table-responsive table-bordered">
        <thead>
        <tr>

            <th>Proveedor</th>

            <th>Descripci&oacute;n</th>

            <th>Tipo de compra</th>

            <th>Monto</th>

            <th>Usuario</th>

            <th>Fecha de transacci&oacute;n</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${results}" status="i" var="res">
            <tr class="${(i % 2) == 0 ? 'info' : 'active'}">

                <td>${res.supplier}</td>

                <td>${res.buyDescription}</td>

                <td>${res.buyType}</td>

                <td>${res.buyAmount}</td>

                <td>${res.username}</td>

                <td>${res.buyDate}</td>

                <%
                    if(res.buyType=="CREDITO")
                        totalCredit = totalCredit + res.buyAmount
                    else
                        totalBuys = totalBuys + res.buyAmount
                %>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="row alert alert-info">
    <div class="col-md-4">
        <span style="font-size: 30px;font-weight: bold;font-style: italic;">CONTADO: $ ${totalBuys}</span>
    </div>
    <div class="col-md-4">
        <span style="font-size: 30px;font-weight: bold;font-style: italic;">CREDITO: $ ${totalCredit}</span>
    </div>
    <div class="col-md-4">
        <span style="font-size: 30px;font-weight: bold;font-style: italic;">Exportar datos a <export:formats formats="['excel']" action="export" class="btn btn-success"/></span>
    </div>
</div>
</body>
</html>
