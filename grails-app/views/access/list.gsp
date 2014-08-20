
<%@ page import="mitienda.Access" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert alert-warning">
			<h3>Lista de accesos</h3>
			<table class="table table-responsive table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="Nombre" />
					
						<g:sortableColumn property="description" title="Descripci&oacute;n" />
					
						<g:sortableColumn property="category" title="Categor&iacute;a?" />
					
						<g:sortableColumn property="subcategory" title="Sub-categor&iacute;a?" />
					
						<g:sortableColumn property="categoryId" title="Id de categor&iacute;a" />
					
						<g:sortableColumn property="control" title="Controller" />

                        <g:sortableColumn property="act" title="Action" />

                        <g:sortableColumn property="show" title="Mostrar?" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${accessInstanceList}" status="i" var="accessInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${accessInstance.id}">${fieldValue(bean: accessInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: accessInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: accessInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: accessInstance, field: "subcategory")}</td>
					
						<td>${fieldValue(bean: accessInstance, field: "categoryId")}</td>
					
						<td>${fieldValue(bean: accessInstance, field: "control")}</td>

                        <td>${fieldValue(bean: accessInstance, field: "act")}</td>

                        <td>${fieldValue(bean: accessInstance, field: "show")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${accessInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
