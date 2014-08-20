
<%@ page import="mitienda.AdminUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert alert-warning">
            <div class="col-md-3">&nbsp;</div>
            <div class="col-md-6">
			<h3>Datos ingresados</h3>
                <ul class="list-group" style="font-size: 16px;">

                    <g:if test="${adminUserInstance?.name}">
                    <li class="list-group-item">
                        <span id="name-label"><strong>Nombre:</strong> <g:fieldValue bean="${adminUserInstance}" field="name"/></span>
                    </li>
                    </g:if>

                    <g:if test="${adminUserInstance?.lastname}">
                    <li class="list-group-item">
                        <span id="lastname-label" class="property-label"><strong>Apellido:</strong> <g:fieldValue bean="${adminUserInstance}" field="lastname"/></span>
                    </li>
                    </g:if>

                    <g:if test="${adminUserInstance?.address}">
                    <li class="list-group-item">
                        <span id="address-label" class="property-label"><strong>Direcci&oacute;n:</strong> <g:fieldValue bean="${adminUserInstance}" field="address"/></span>
                    </li>
                    </g:if>

                    <g:if test="${adminUserInstance?.phone}">
                    <li class="list-group-item">
                        <span id="phone-label" class="property-label"><strong>Tel&eacute;fono:</strong> <g:fieldValue bean="${adminUserInstance}" field="phone"/></span>
                    </li>
                    </g:if>

                    <g:if test="${adminUserInstance?.branch}">
                    <li class="list-group-item">
                        <span id="branch-label" class="property-label"><strong>Sucursal:</strong> ${branchName}</span>
                    </li>
                    </g:if>

                    <g:if test="${adminUserInstance?.status}">
                    <li class="list-group-item">
                        <span id="status-label" class="property-label"><strong>Estatus:</strong> <g:fieldValue bean="${adminUserInstance}" field="status"/></span>
                    </li>
                    </g:if>

                    <g:if test="${adminUserInstance?.username}">
                        <li class="list-group-item">
                            <span id="username-label" class="property-label"><strong>Nombre de usuario:</strong> <g:fieldValue bean="${adminUserInstance}" field="username"/></span>
                        </li>
                    </g:if>

                    <g:if test="${adminUserInstance?.password}">
                        <li class="list-group-item">
                            <span id="password-label" class="property-label"><strong>Contrase&ntilde;a:</strong> <g:fieldValue bean="${adminUserInstance}" field="password"/></span>
                        </li>
                    </g:if>

                    <g:if test="${adminUserInstance?.role}">
                        <li class="list-group-item">
                            <span id="role-label" class="property-label"><strong>Rol:</strong> ${roleName}</span>
                        </li>
                    </g:if>

                    <g:if test="${adminUserInstance?.photo}">
                    <li class="list-group-item">
                        <span id="photo-label" class="property-label"><strong>Foto:</strong> <img src="${resource(dir:'userPhotos',file:adminUserInstance.photo)}" class="img-thumbnail" width="100px"/></span>
                    </li>
                    </g:if>

                    <g:if test="${adminUserInstance?.registerDate}">
                    <li class="list-group-item">
                        <span id="registerDate-label" class="property-label"><strong>Fecha de registro:</strong> <g:formatDate date="${adminUserInstance?.registerDate}" format="dd/MMM/yyyy"/></span>
                    </li>
                    </g:if>

                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
