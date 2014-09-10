
<%@ page import="mitienda.Region" %>
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

                    <g:if test="${regionInstance?.region}">
                    <li class="list-group-item">
                        <span id="region-label" class="property-label"><strong>Regi&oacute;n:</strong> </span>

                            <span class="property-value" aria-labelledby="region-label"><g:fieldValue bean="${regionInstance}" field="region"/></span>

                    </li>
                    </g:if>

                    <g:if test="${regionInstance?.description}">
                    <li class="list-group-item">
                        <span id="description-label" class="property-label"><strong>Descripci&oacute;n:</strong> </span>

                            <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${regionInstance}" field="description"/></span>

                    </li>
                    </g:if>

                    <g:if test="${regionInstance?.registerDate}">
                    <li class="list-group-item">
                        <span id="registerDate-label" class="property-label"><strong>Fecha de registro:</strong> </span>

                            <span class="property-value" aria-labelledby="registerDate-label"><g:formatDate date="${regionInstance?.registerDate}" format="dd/MMM/yyyy" /></span>

                    </li>
                    </g:if>

                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
