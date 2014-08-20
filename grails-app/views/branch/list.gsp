
<%@ page import="mitienda.Branch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert alert-warning">
			<h3>Lista de sucursales</h3>
			<table class="table table-responsive table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="region" title="Regi&oacute;n" />
					
						<g:sortableColumn property="branch" title="Sucursal" />
					
						<g:sortableColumn property="description" title="Descripci&oacute;n" />
					
						<g:sortableColumn property="status" title="Estatus" />
					
						<g:sortableColumn property="registerDate" title="Fecha de registro" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${branchInstanceList}" status="i" var="branchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${branchInstance.id}">${fieldValue(bean: branchInstance, field: "region")}</g:link></td>
					
						<td>${fieldValue(bean: branchInstance, field: "branch")}</td>
					
						<td>${fieldValue(bean: branchInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: branchInstance, field: "status")}</td>
					
						<td><g:formatDate date="${branchInstance.registerDate}" format="dd/MMM/yyyy"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${branchInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
