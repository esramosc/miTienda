<% def flag = false; %>
<table class="table table-responsive table-bordered">
    <thead>
    <tr>
        <th>Nombre(s)</th>
        <th>Apellido(s)</th>
        <th>Tel&eacute;fono</th>
        <th>Direcci&oacute;n</th>
        <th>Estatus</th>
        <th>Comentarios</th>
        <th>Fecha de registro</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${results}" var="res">
        <% flag = true; %>
        <tr>
            <td><g:link action="edit" id="${res.id}">${res.name}</g:link></td>
            <td>${res.lastname}</td>
            <td>${res.phone}</td>
            <td>${res.address}</td>
            <td>${res.status}</td>
            <td>${res.comment}</td>
            <td><g:formatDate date="${res.registerDate}" format="dd/MMM/yyyy"/></td>
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