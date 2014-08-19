
<%@ page import="mitienda.AdminUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert alert-warning">
            <div class="col-md-1">&nbsp;</div>
            <div class="col-md-10">
                <h3>Lista de usuarios</h3>
                <table class="table table-responsive table-bordered">
                    <thead>
                        <tr>

                            <g:sortableColumn property="name" title="Nombre" />

                            <g:sortableColumn property="lastname" title="Apellido" />

                            <g:sortableColumn property="address" title="Direcci&oacute;n" />

                            <g:sortableColumn property="phone" title="Tel&eacute;fono" />

                            <g:sortableColumn property="branch" title="Sucursal" />

                            <g:sortableColumn property="status" title="Estatus" />

                            <g:sortableColumn property="username" title="usuario" />

                            <g:sortableColumn property="password" title="Contrase&ntilde;a" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${adminUserInstanceList}" status="i" var="adminUserInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${adminUserInstance.id}">${fieldValue(bean: adminUserInstance, field: "name")}</g:link></td>

                            <td>${fieldValue(bean: adminUserInstance, field: "lastname")}</td>

                            <td>${fieldValue(bean: adminUserInstance, field: "address")}</td>

                            <td>${fieldValue(bean: adminUserInstance, field: "phone")}</td>

                            <td>${fieldValue(bean: adminUserInstance, field: "branch")}</td>

                            <td>${fieldValue(bean: adminUserInstance, field: "status")}</td>

                            <td>${fieldValue(bean: adminUserInstance, field: "username")}</td>

                            <td>${fieldValue(bean: adminUserInstance, field: "password")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="pagination">
                    <g:paginate total="${adminUserInstanceTotal}" />
                </div>
            </div>
            <div class="col-md-1">&nbsp;</div>
		</div>
	</body>
</html>
