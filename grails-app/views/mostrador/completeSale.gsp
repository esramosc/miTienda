<%@ page import="mitienda.Mostrador" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
    </head>
    <body>
        <div class="row alert">
            <div class="col-md-2">&nbsp;</div>
            <div class="col-md-8 alert alert-warning">
                <table class="table table-bordered table-responsive" style="font-size: 20pt;">
                    <thead>
                        <tr>
                            <th>Total</th>
                            <th>Pago</th>
                            <th>Cambio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>$ ${total}</td>
                            <td>$ ${pago}</td>
                            <td>$ ${cambio}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-2">&nbsp;</div>
        </div>
        <div class="row">
            <div class="col-md-5">&nbsp;</div>
            <div class="col-md-2">
                <g:link action="create" class="alert alert-success">Realizar otra venta</g:link>
            </div>
            <div class="col-md-5">&nbsp;</div>
        </div>
        <div class="row">&nbsp;</div>
    </body>
</html>
