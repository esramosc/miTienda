<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <r:require module="export"/>
    </head>
    <body>
        <div class="row alert">
            <h3>Reporte de productos por agotarse</h3>
            <table class="table table-responsive table-bordered">
                <thead>
                <tr>

                    <th>Producto</th>

                    <th>Descripci&oacute;n</th>

                    <th>Cantidad m&iacute;nima</th>

                    <th>Cantidad actual</th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${results}" status="i" var="res">
                    <tr class="${(i % 2) == 0 ? 'info' : 'active'}">

                        <td>${res.product}</td>

                        <td>${res.description}</td>

                        <td>${res.minQuantity}</td>

                        <td>${res.quantity}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <div class="row alert alert-info">
            <div class="col-md-1">&nbsp;</div>
            <div class="col-md-5">
                <span style="font-size: 30px;font-weight: bold;font-style: italic;">Exportar datos a <export:formats formats="['excel']" params="[branchId:branchId]" action="export" class="btn btn-success"/></span>
            </div>
            <div class="col-md-5">
                &nbsp;
            </div>
            <div class="col-md-1">&nbsp;</div>
        </div>
    </body>
</html>
