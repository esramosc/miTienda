<!DOCTYPE html>
<%
    def totalDebt = 0.0
%>
<html>
<head>
    <meta name="layout" content="main">
    <r:require module="export"/>
</head>
<body>
<div class="row alert">
    <h3>Reporte de creditos pendientes</h3>
    <table class="table table-responsive table-bordered">
        <thead>
        <tr>

            <th>Cliente</th>

            <th>Deuda total</th>

            <th>Abonos</th>

            <th>Deuda actual</th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${results}" status="i" var="res">
            <tr class="${(i % 2) == 0 ? 'info' : 'active'}">

                <td>${res.customer}</td>

                <td>$ ${res.amount}</td>

                <td>$ ${res.payments}</td>

                <td>$ ${res.debt}</td>

                <%
                    totalDebt = totalDebt + res.debt
                %>

            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="row alert alert-info">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-5">
        <span style="font-size: 30px;font-weight: bold;font-style: italic;">Total de deuda: $ ${totalDebt}</span>
    </div>
    <div class="col-md-5">
        <span style="font-size: 30px;font-weight: bold;font-style: italic;">Exportar datos a <export:formats formats="['excel']" params="[branchId:branchId]" action="export" class="btn btn-success"/></span>
    </div>
    <div class="col-md-1">&nbsp;</div>
</div>
</body>
</html>
