
<%@ page import="mitienda.Role" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert">
			<h3>Lista de roles</h3>
			<table class="table table-responsive table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="roleName" title="Rol" />
					
						<g:sortableColumn property="roleDescription" title="Descripci&oacute;n" />
					
						<g:sortableColumn property="registerDate" title="Fecha de registro" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${roleInstanceList}" status="i" var="roleInstance">
					<tr class="${(i % 2) == 0 ? 'info' : 'default'}">
					
						<td><g:link action="edit" id="${roleInstance.id}">${fieldValue(bean: roleInstance, field: "roleName")}</g:link></td>
					
						<td>${fieldValue(bean: roleInstance, field: "roleDescription")}</td>
					
						<td><g:formatDate date="${roleInstance.registerDate}" format="dd/MMM/yyyy"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
            <% if(roleInstanceTotal>10){ %>
                <div class="pagination">
                    <g:paginate total="${roleInstanceTotal}" />
                </div>
            <% } %>
		</div>
	</body>
</html>
