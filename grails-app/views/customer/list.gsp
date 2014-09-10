
<%@ page import="mitienda.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-3">&nbsp;</div>
            <div class="col-md-6 alert alert-success">
                Introduce el nombre del cliente a buscar:
                <input type="text" name="description" width="350px" class="input-sm" onkeyup="${remoteFunction(controller: 'customer', action: 'searchByDesc', update: [success: 'customerList', failure: 'error'], params: ' \'description=\'+this.value')}"/>
            </div>
            <div class="col-md-3">&nbsp;</div>
        </div>
		<div class="row alert">
			<h3>Lista de clientes</h3>
            <span id="customerList">
                <table class="table table-responsive table-bordered">
                    <thead>
                        <tr>

                            <g:sortableColumn property="name" title="Nombre(s)" />

                            <g:sortableColumn property="lastname" title="Apellido(s)" />

                            <g:sortableColumn property="phone" title="Tel&eacute;fono" />

                            <g:sortableColumn property="address" title="Direcci&oacute;n" />

                            <g:sortableColumn property="status" title="Estatus" />

                            <g:sortableColumn property="comment" title="Comentarios" />

                            <g:sortableColumn property="registerDate" title="Fecha de registro" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'info' : 'default'}">

                            <td><g:link action="edit" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "name")}</g:link></td>

                            <td>${fieldValue(bean: customerInstance, field: "lastname")}</td>

                            <td>${fieldValue(bean: customerInstance, field: "phone")}</td>

                            <td>${fieldValue(bean: customerInstance, field: "address")}</td>

                            <td>${fieldValue(bean: customerInstance, field: "status")}</td>

                            <td>${fieldValue(bean: customerInstance, field: "comment")}</td>

                            <td><g:formatDate date="${customerInstance.registerDate}" format="dd/MMM/yyyy"/></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </span>
            <% if(customerInstanceTotal>10){ %>
                <div class="pagination">
                    <g:paginate total="${customerInstanceTotal}" />
                </div>
            <% } %>
		</div>
	</body>
</html>
