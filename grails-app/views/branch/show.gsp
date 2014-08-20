
<%@ page import="mitienda.Branch" %>
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

                    <g:if test="${branchInstance?.region}">
                    <li class="list-group-item">
                        <span id="region-label" class="property-label"><strong>Regi&oacute;n:</strong> </span>

                            <span class="property-value" aria-labelledby="region-label"><g:fieldValue bean="${regionInstance}" field="region"/></span>

                    </li>
                    </g:if>

                    <g:if test="${branchInstance?.branch}">
                    <li class="list-group-item">
                        <span id="branch-label" class="property-label"><strong>Nombre de la sucursal:</strong> </span>

                            <span class="property-value" aria-labelledby="branch-label"><g:fieldValue bean="${branchInstance}" field="branch"/></span>

                    </li>
                    </g:if>

                    <g:if test="${branchInstance?.description}">
                    <li class="list-group-item">
                        <span id="description-label" class="property-label"><strong>Descripci&oacute;n:</strong> </span>

                            <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${branchInstance}" field="description"/></span>

                    </li>
                    </g:if>

                    <g:if test="${branchInstance?.status}">
                    <li class="list-group-item">
                        <span id="status-label" class="property-label"><strong>Estatus:</strong> </span>

                            <span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${branchInstance}" field="status"/></span>

                    </li>
                    </g:if>

                    <g:if test="${branchInstance?.registerDate}">
                    <li class="list-group-item">
                        <span id="registerDate-label" class="property-label"><strong>Fecha de registro:</strong> </span>

                            <span class="property-value" aria-labelledby="registerDate-label"><g:formatDate date="${branchInstance?.registerDate}" format="dd/MMM/yyyy"/></span>

                    </li>
                    </g:if>

                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
