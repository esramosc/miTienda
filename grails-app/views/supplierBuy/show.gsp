
<%@ page import="mitienda.SupplierBuy" %>
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

                    <g:if test="${supplierBuyInstance?.supplierId}">
                    <li class="list-group-item">
                        <span id="supplierId-label" class="property-label"><strong>Proveedor: </strong></span>

                            <span class="property-value" aria-labelledby="supplierId-label">${supplierName}</span>

                    </li>
                    </g:if>

                    <g:if test="${supplierBuyInstance?.buyDescription}">
                    <li class="list-group-item">
                        <span id="buyDescription-label" class="property-label"><strong>Descripci&oacute;n de la compra: </strong></span>

                            <span class="property-value" aria-labelledby="buyDescription-label"><g:fieldValue bean="${supplierBuyInstance}" field="buyDescription"/></span>

                    </li>
                    </g:if>

                    <g:if test="${supplierBuyInstance?.buyAmount}">
                    <li class="list-group-item">
                        <span id="buyAmount-label" class="property-label"><strong>Monto de la compra: </strong></span>

                            <span class="property-value" aria-labelledby="buyAmount-label"><g:fieldValue bean="${supplierBuyInstance}" field="buyAmount"/></span>

                    </li>
                    </g:if>

                    <g:if test="${supplierBuyInstance?.buyType}">
                    <li class="list-group-item">
                        <span id="buyType-label" class="property-label"><strong>Tipo de compra: </strong></span>

                            <span class="property-value" aria-labelledby="buyType-label"><g:fieldValue bean="${supplierBuyInstance}" field="buyType"/></span>

                    </li>
                    </g:if>

                    <g:if test="${supplierBuyInstance?.buyDate}">
                    <li class="list-group-item">
                        <span id="buyDate-label" class="property-label"><strong>Fecha de compra: </strong></span>

                            <span class="property-value" aria-labelledby="buyDate-label"><g:formatDate date="${supplierBuyInstance?.buyDate}" format="dd/MMM/yyyy"/></span>

                    </li>
                    </g:if>



                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
