
<%@ page import="mitienda.Supplier" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert">
			<h3>Lista de proveedores</h3>
			<table class="table table-responsive table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="enterprise" title="Empresa" />
					
						<g:sortableColumn property="description" title="Descripci&oacute;n" />
					
						<g:sortableColumn property="phone" title="Tel&eacute;fono" />
					
						<g:sortableColumn property="address" title="Direcci&oacute;n" />
					
						<g:sortableColumn property="registerDate" title="Fecha de registro" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${supplierInstanceList}" status="i" var="supplierInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${supplierInstance.id}">${fieldValue(bean: supplierInstance, field: "enterprise")}</g:link></td>
					
						<td>${fieldValue(bean: supplierInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: supplierInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: supplierInstance, field: "address")}</td>
					
						<td><g:formatDate date="${supplierInstance.registerDate}" format="dd/MMM/yyyy" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
            <% if(supplierInstanceTotal>10){ %>
                <div class="pagination">
                    <g:paginate total="${supplierInstanceTotal}" />
                </div>
            <% } %>
		</div>
	</body>
</html>
