
<%@ page import="mitienda.Region" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert alert-warning">
			<h3>Lista de regiones</h3>
			<table class="table table-responsive table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="region" title="Regi&oacute;n" />
					
						<g:sortableColumn property="description" title="Descripci&oacute;n" />
					
						<g:sortableColumn property="registerDate" title="Fecha de registro" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${regionInstanceList}" status="i" var="regionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${regionInstance.id}">${fieldValue(bean: regionInstance, field: "region")}</g:link></td>
					
						<td>${fieldValue(bean: regionInstance, field: "description")}</td>
					
						<td><g:formatDate date="${regionInstance.registerDate}" format="dd/MMM/yyyy"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${regionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
