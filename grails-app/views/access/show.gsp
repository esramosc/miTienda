
<%@ page import="mitienda.Access" %>
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

                    <g:if test="${accessInstance?.name}">
                    <li class="list-group-item">
                        <span id="name-label" class="property-label"><strong>Nombre: </strong></span>

                            <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${accessInstance}" field="name"/></span>

                    </li>
                    </g:if>

                    <g:if test="${accessInstance?.description}">
                    <li class="list-group-item">
                        <span id="description-label" class="property-label"><strong>Descripci&oacute;n: </strong></span>

                            <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${accessInstance}" field="description"/></span>

                    </li>
                    </g:if>

                    <g:if test="${accessInstance?.category}">
                    <li class="list-group-item">
                        <span id="category-label" class="property-label"><strong>Categor&iacute;a?: </strong></span>

                            <span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${accessInstance}" field="category"/></span>

                    </li>
                    </g:if>

                    <g:if test="${accessInstance?.subcategory}">
                    <li class="list-group-item">
                        <span id="subcategory-label" class="property-label"><strong>Sub-categor&iacute;a?: </strong></span>

                            <span class="property-value" aria-labelledby="subcategory-label"><g:fieldValue bean="${accessInstance}" field="subcategory"/></span>

                    </li>
                    </g:if>

                    <g:if test="${accessInstance?.categoryId}">
                    <li class="list-group-item">
                        <span id="categoryId-label" class="property-label"><strong>Id de la categor&iacute;a: </strong></span>

                            <span class="property-value" aria-labelledby="categoryId-label"><g:fieldValue bean="${accessInstance}" field="categoryId"/></span>

                    </li>
                    </g:if>

                    <g:if test="${accessInstance?.control}">
                    <li class="list-group-item">
                        <span id="control-label" class="property-label"><strong>Controller: </strong></span>

                            <span class="property-value" aria-labelledby="control-label"><g:fieldValue bean="${accessInstance}" field="control"/></span>

                    </li>
                    </g:if>

                    <g:if test="${accessInstance?.act}">
                    <li class="list-group-item">
                        <span id="act-label" class="property-label"><strong>Action: </strong></span>

                            <span class="property-value" aria-labelledby="act-label"><g:fieldValue bean="${accessInstance}" field="act"/></span>

                    </li>
                    </g:if>

                    <g:if test="${accessInstance?.show}">
                    <li class="list-group-item">
                        <span id="show-label" class="property-label"><strong>Mostrar?: </strong></span>

                            <span class="property-value" aria-labelledby="show-label"><g:fieldValue bean="${accessInstance}" field="show"/></span>

                    </li>
                    </g:if>

                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
