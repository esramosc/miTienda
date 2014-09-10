
<%@ page import="mitienda.Role" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row">
            <div class="col-md-3">&nbsp;</div>
            <div class="col-md-6">
                <h3>Datos ingresados</h3>
                <ul class="list-group">

                    <g:if test="${roleInstance?.roleName}">
                    <li class="list-group-item">
                        <span id="roleName-label" class="property-label"><strong>Rol: </strong></span>

                            <span class="property-value" aria-labelledby="roleName-label"><g:fieldValue bean="${roleInstance}" field="roleName"/></span>

                    </li>
                    </g:if>

                    <g:if test="${roleInstance?.roleDescription}">
                    <li class="list-group-item">
                        <span id="roleDescription-label" class="property-label"><strong>Descripci&oacute;n: </strong></span>

                            <span class="property-value" aria-labelledby="roleDescription-label"><g:fieldValue bean="${roleInstance}" field="roleDescription"/></span>

                    </li>
                    </g:if>

                    <g:if test="${roleInstance?.registerDate}">
                    <li class="list-group-item">
                        <span id="registerDate-label" class="property-label"><strong>Fecha de registro: </strong></span>

                            <span class="property-value" aria-labelledby="registerDate-label"><g:formatDate date="${roleInstance?.registerDate}" format="dd/MMM/yyyy"/></span>

                    </li>
                    </g:if>

                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
