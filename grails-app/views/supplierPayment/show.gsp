
<%@ page import="mitienda.SupplierPayment" %>
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

                    <g:if test="${supplierPaymentInstance?.supplierId}">
                    <li class="list-group-item">
                        <span id="supplierId-label" class="property-label"><strong>Proveedor: </strong></span>

                            <span class="property-value" aria-labelledby="supplierId-label">${supplierName}</span>

                    </li>
                    </g:if>

                    <g:if test="${supplierPaymentInstance?.actualAmount}">
                    <li class="list-group-item">
                        <span id="actualAmount-label" class="property-label"><strong>Monto Anterior: </strong></span>

                            <span class="property-value" aria-labelledby="actualAmount-label">$ <g:fieldValue bean="${supplierPaymentInstance}" field="actualAmount"/></span>

                    </li>
                    </g:if>

                    <g:if test="${supplierPaymentInstance?.payment}">
                    <li class="list-group-item">
                        <span id="payment-label" class="property-label"><strong>Abono: </strong></span>

                            <span class="property-value" aria-labelledby="payment-label">$ <g:fieldValue bean="${supplierPaymentInstance}" field="payment"/></span>

                    </li>
                    </g:if>

                    <g:if test="${supplierPaymentInstance?.registerDate}">
                    <li class="list-group-item">
                        <span id="registerDate-label" class="property-label"><strong>Fecha de transacci&oacute;n: </strong></span>

                            <span class="property-value" aria-labelledby="registerDate-label"><g:formatDate date="${supplierPaymentInstance?.registerDate}" format="dd/MMM/yyyy"/></span>

                    </li>
                    </g:if>

                    <li class="list-group-item">
                        <span id="username-label" class="property-label"><strong>Monto actual: </strong></span>

                            <span class="property-value" aria-labelledby="username-label">$ <% print supplierPaymentInstance.actualAmount - supplierPaymentInstance.payment  %></span>

                    </li>

                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
