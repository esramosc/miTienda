
<%@ page import="mitienda.CreditPayments" %>
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

                    <g:if test="${creditPaymentsInstance?.customerId}">
                    <li class="list-group-item">
                        <span id="customerId-label" class="property-label"><strong>Cliente: </strong></span>

                            <span class="property-value" aria-labelledby="customerId-label">${customerName}</span>

                    </li>
                    </g:if>

                    <g:if test="${creditPaymentsInstance?.amount}">
                    <li class="list-group-item">
                        <span id="amount-label" class="property-label"><strong>Monto anterior: </strong></span>

                            <span class="property-value" aria-labelledby="amount-label">$ <g:fieldValue bean="${creditPaymentsInstance}" field="amount"/></span>

                    </li>
                    </g:if>

                    <g:if test="${creditPaymentsInstance?.payment}">
                    <li class="list-group-item">
                        <span id="payment-label" class="property-label"><strong>Abono: </strong></span>

                            <span class="property-value" aria-labelledby="payment-label">$ <g:fieldValue bean="${creditPaymentsInstance}" field="payment"/></span>

                    </li>
                    </g:if>

                    <li class="list-group-item">
                        <span id="payment-label" class="property-label"><strong>Monto actual: </strong></span>

                        <span class="property-value" aria-labelledby="payment-label">$ ${creditPaymentsInstance.amount - creditPaymentsInstance.payment}</span>

                    </li>

                    <g:if test="${creditPaymentsInstance?.tranDate}">
                    <li class="list-group-item">
                        <span id="tranDate-label" class="property-label"><strong>Fecha: </strong></span>

                            <span class="property-value" aria-labelledby="tranDate-label"><g:formatDate date="${creditPaymentsInstance?.tranDate}" format="dd/MMM/yyyy" /></span>

                    </li>
                    </g:if>

                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
