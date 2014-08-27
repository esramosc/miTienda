
<%@ page import="mitienda.Products" %>
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

                    <g:if test="${productsInstance?.category}">
                        <li class="list-group-item">
                            <span id="category-label" class="property-label"><strong>Categor&iacute;a: </strong></span>

                            <span class="property-value" aria-labelledby="category-label">${categoryDesc}</span>

                        </li>
                    </g:if>

                    <g:if test="${productsInstance?.product}">
                    <li class="list-group-item">
                        <span id="product-label" class="property-label"><strong>Producto: </strong></span>

                            <span class="property-value" aria-labelledby="product-label"><g:fieldValue bean="${productsInstance}" field="product"/></span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.description}">
                    <li class="list-group-item">
                        <span id="description-label" class="property-label"><strong>Descripci&oacute;n: </strong></span>

                            <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productsInstance}" field="description"/></span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.quantity}">
                    <li class="list-group-item">
                        <span id="quantity-label" class="property-label"><strong>Cantidad: </strong></span>

                            <span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${productsInstance}" field="quantity"/></span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.buyPrice}">
                    <li class="list-group-item">
                        <span id="buyPrice-label" class="property-label"><strong>Precio de compra: </strong></span>

                            <span class="property-value" aria-labelledby="buyPrice-label"><g:fieldValue bean="${productsInstance}" field="buyPrice"/></span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.salePrice}">
                    <li class="list-group-item">
                        <span id="salePrice-label" class="property-label"><strong>Precio de venta: </strong></span>

                            <span class="property-value" aria-labelledby="salePrice-label"><g:fieldValue bean="${productsInstance}" field="salePrice"/></span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.mayorPrice}">
                    <li class="list-group-item">
                        <span id="mayorPrice-label" class="property-label"><strong>Precio mayorista: </strong></span>

                            <span class="property-value" aria-labelledby="mayorPrice-label"><g:fieldValue bean="${productsInstance}" field="mayorPrice"/></span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.tax}">
                    <li class="list-group-item">
                        <span id="tax-label" class="property-label"><strong>IVA: </strong></span>

                            <span class="property-value" aria-labelledby="tax-label"><g:fieldValue bean="${productsInstance}" field="tax"/></span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.minQuantity}">
                    <li class="list-group-item">
                        <span id="minQuantity-label" class="property-label"><strong>Cantidad m&iacute;nima en inventario: </strong></span>

                            <span class="property-value" aria-labelledby="minQuantity-label"><g:fieldValue bean="${productsInstance}" field="minQuantity"/></span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.barCode}">
                    <li class="list-group-item">
                        <span id="barCode-label" class="property-label"><strong>C&oacute;digo de barras: </strong></span>

                            <span class="property-value" aria-labelledby="barCode-label"><g:fieldValue bean="${productsInstance}" field="barCode"/></span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.type}">
                    <li class="list-group-item">
                        <span id="type-label" class="property-label"><strong>Tipo de unidad: </strong></span>

                            <span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${productsInstance}" field="type"/></span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.image}">
                    <li class="list-group-item">
                        <span id="image-label" class="property-label"><strong>Imagen: </strong></span>

                            <span class="property-value" aria-labelledby="image-label">
                                <img src="${resource(dir:'products',file:productsInstance.image)}" class="img-thumbnail" width="100px">
                            </span>

                    </li>
                    </g:if>

                    <g:if test="${productsInstance?.registerDate}">
                    <li class="list-group-item">
                        <span id="registerDate-label" class="property-label"><strong>Fecha de registro: </strong></span>

                            <span class="property-value" aria-labelledby="registerDate-label"><g:formatDate date="${productsInstance?.registerDate}" format="dd/MMM/yyyy"/></span>

                    </li>
                    </g:if>

                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
