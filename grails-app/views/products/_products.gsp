<% def flag = false; %>
<table class="table table-responsive table-bordered">
    <thead>
    <tr>
        <th>Categor&iacute;a</th>
        <th>Producto</th>
        <th>Descripci&oacute;n</th>
        <th>Cantidad</th>
        <th>Precio de compra</th>
        <th>Precio de venta</th>
        <th>Precio mayoristas</th>
        <th>IVA</th>
        <th>Tipo de unidad</th>
    </tr>
    </thead>
    <tbody>
        <g:each in="${results}" var="res">
            <% flag = true; %>
            <tr>
                <td>${res.category}</td>
                <td><g:link action="edit" id="${res.id}">${res.product}</g:link></td>
                <td>${res.description}</td>
                <td>${res.quantity}</td>
                <td>${res.buyPrice}</td>
                <td>${res.salePrice}</td>
                <td>${res.mayorPrice}</td>
                <td>${res.tax}</td>
                <td>${res.type}</td>
            </tr>
        </g:each>
    <% if(!flag){ %>
        <tr>
            <td colspan="9" style="text-align: center;"><h1>No se encontraron productos con ese texto</h1></td>
        </tr>
    <% } %>
    </tbody>
</table>
<% if(isEmpty){ %>
    <script type="text/javascript">
        location.reload();
    </script>
<% } %>