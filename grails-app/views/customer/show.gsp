
<%@ page import="mitienda.Customer" %>
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

                    <g:if test="${customerInstance?.name}">
                    <li class="list-group-item">
                        <span id="name-label" class="property-label"><strong>Nombre(s): </strong></span>

                            <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${customerInstance}" field="name"/></span>

                    </li>
                    </g:if>

                    <g:if test="${customerInstance?.lastname}">
                    <li class="list-group-item">
                        <span id="lastname-label" class="property-label"><strong>Apellido(s): </strong></span>

                            <span class="property-value" aria-labelledby="lastname-label"><g:fieldValue bean="${customerInstance}" field="lastname"/></span>

                    </li>
                    </g:if>

                    <g:if test="${customerInstance?.phone}">
                    <li class="list-group-item">
                        <span id="phone-label" class="property-label"><strong>Tel&eacute;fono: </strong></span>

                            <span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${customerInstance}" field="phone"/></span>

                    </li>
                    </g:if>

                    <g:if test="${customerInstance?.address}">
                    <li class="list-group-item">
                        <span id="address-label" class="property-label"><strong>Direcci&oacute;n: </strong></span>

                            <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${customerInstance}" field="address"/></span>

                    </li>
                    </g:if>

                    <g:if test="${customerInstance?.status}">
                    <li class="list-group-item">
                        <span id="status-label" class="property-label"><strong>Estatus: </strong></span>

                            <span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${customerInstance}" field="status"/></span>

                    </li>
                    </g:if>

                    <g:if test="${customerInstance?.comment}">
                    <li class="list-group-item">
                        <span id="comment-label" class="property-label"><strong>Comentarios: </strong></span>

                            <span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${customerInstance}" field="comment"/></span>

                    </li>
                    </g:if>

                    <g:if test="${customerInstance?.registerDate}">
                        <li class="list-group-item">
                            <span id="registerDate-label" class="property-label"><strong>Fecha de registro: </strong></span>

                            <span class="property-value" aria-labelledby="registerDate-label"><g:formatDate bean="${customerInstance}" field="comment" format="dd/MMM/yyyy"/></span>

                        </li>
                    </g:if>

                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
