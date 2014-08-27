
<%@ page import="mitienda.Supplier" %>
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
                <ul class="list-group">

                    <g:if test="${supplierInstance?.enterprise}">
                    <li class="list-group-item">
                        <span id="enterprise-label" class="property-label"><strong>Empresa: </strong></span>

                            <span class="property-value" aria-labelledby="enterprise-label"><g:fieldValue bean="${supplierInstance}" field="enterprise"/></span>

                    </li>
                    </g:if>

                    <g:if test="${supplierInstance?.description}">
                    <li class="list-group-item">
                        <span id="description-label" class="property-label"><strong>Descripci&oacute;n: </strong></span>

                            <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${supplierInstance}" field="description"/></span>

                    </li>
                    </g:if>

                    <g:if test="${supplierInstance?.phone}">
                    <li class="list-group-item">
                        <span id="phone-label" class="property-label"><strong>Tel&eacute;fono: </strong></span>

                            <span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${supplierInstance}" field="phone"/></span>

                    </li>
                    </g:if>

                    <g:if test="${supplierInstance?.address}">
                    <li class="list-group-item">
                        <span id="address-label" class="property-label"><strong>Direcci&oacute;n: </strong></span>

                            <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${supplierInstance}" field="address"/></span>

                    </li>
                    </g:if>

                    <g:if test="${supplierInstance?.registerDate}">
                    <li class="list-group-item">
                        <span id="registerDate-label" class="property-label"><strong>Fecha de registro: </strong></span>

                            <span class="property-value" aria-labelledby="registerDate-label"><g:formatDate date="${supplierInstance?.registerDate}" format="dd/MMM/yyyy"/></span>

                    </li>
                    </g:if>

                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
