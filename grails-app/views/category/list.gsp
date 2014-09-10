
<%@ page import="mitienda.Category" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert">
			<h3>Lista de categor&iacute;as</h3>
			<table class="table table-responsive table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="Categor&iacute;a" />
					
						<g:sortableColumn property="description" title="Descripci&oacute;n" />
					
						<g:sortableColumn property="registerDate" title="Fecha de registro" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${categoryInstanceList}" status="i" var="categoryInstance">
					<tr class="${(i % 2) == 0 ? 'info' : 'default'}">
					
						<td><g:link action="edit" id="${categoryInstance.id}">${fieldValue(bean: categoryInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: categoryInstance, field: "description")}</td>
					
						<td><g:formatDate date="${categoryInstance.registerDate}" format="dd/MMM/yyyy"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
            <% if(categoryInstanceTotal>10){ %>
                <div class="pagination">
                    <g:paginate total="${categoryInstanceTotal}" />
                </div>
            <% } %>
		</div>
	</body>
</html>
