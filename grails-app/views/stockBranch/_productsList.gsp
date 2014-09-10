<% def flag = false; %>
<table class="table table-responsive table-bordered">
    <thead>
    <tr>
        <th>Sucursal</th>
        <th>Producto</th>
        <th>Cantidad</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${results}" var="res">
        <% flag = true; %>
        <tr>
            <td>${res.branchId}</td>
            <td><g:link action="edit" id="${res.id}">${res.productId}</g:link></td>
            <td>${res.quantity}</td>
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