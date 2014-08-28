<!DOCTYPE html>
<%
    def idMostrador = ""
    def totalSale = 0.0
%>
<html>
<head>
    <meta name="layout" content="main">
    <r:require module="export"/>
</head>
    <body>
        <div class="row alert">
            <h3>Reporte detallado de las ventas del d&iacute;a</h3>
            <table class="table table-responsive table-bordered">
                <thead>
                <tr>

                    <th>Usuario</th>

                    <th>Cliente</th>

                    <th>Monto total</th>

                    <th>Tipo de pago</th>

                    <th>Fecha de transacci&oacute;n</th>

                    <th>Producto</th>

                    <th>Cantidad</th>

                    <th>Precio</th>

                    <th>Total</th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${data}" status="i" var="dt">
                    <tr class="${(i % 2) == 0 ? 'info' : 'active'}">
                        <%
                            if(idMostrador!=dt.idMostrador){
                                idMostrador = dt.idMostrador
                        %>

                            <td>${dt.username}</td>

                            <td>${dt.customer}</td>

                            <td>${dt.amount}</td>

                            <td>${dt.type}</td>

                            <td>${dt.registerDate}</td>
                        <% }else{ %>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        <% } %>

                        <td>${dt.product}</td>

                        <td>${dt.quantity}</td>

                        <td>${dt.price}</td>

                        <td>${dt.total}</td>
                        <%
                            totalSale = totalSale + dt.total
                        %>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <div class="row alert alert-info">
            <div class="col-md-1">&nbsp;</div>
            <div class="col-md-5">
                <span style="font-size: 30px;font-weight: bold;font-style: italic;">Total del d&iacute;a: $ ${totalSale}</span>
            </div>
            <div class="col-md-5">
                <span style="font-size: 30px;font-weight: bold;font-style: italic;">Exportar datos a <export:formats formats="['excel']" action="export" class="btn btn-success"/></span>
            </div>
            <div class="col-md-1">&nbsp;</div>
        </div>
    </body>
</html>
