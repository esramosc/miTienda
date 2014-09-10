<%@ page import="mitienda.CreditPayments" %>


<div class="row">
    <div class="fieldcontain ${hasErrors(bean: creditPaymentsInstance, field: 'customerId', 'error')} required form-group">
        <label for="customerId">
            Nombre del cliente
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="customerName" required="" value="${customerName}" class="form-control" onkeyup="${remoteFunction(controller: 'creditPayments', action: 'getCustomers', update: [success: 'customerList', failure: 'error'], params: ' \'name=\'+this.value')}" autocomplete="off"/>
        <input type="hidden" name="customerId" id="customerId" value="${creditPaymentsInstance.customerId}"/>
        <div id="customerList" style="position: relative;z-index: 2;"></div>
    </div>
</div>
<div class="row">
    <div class="fieldcontain ${hasErrors(bean: creditPaymentsInstance, field: 'amount', 'error')} required form-group">
        <label for="amount">
            Monto actual
            <span class="required-indicator">*</span>
        </label>
        <span class="form-control" id="amountDebt">${creditPaymentsInstance.amount}</span>
        <input type="hidden" name="amount" id="amount" value="${creditPaymentsInstance.amount}">
    </div>
</div>
<div class="row">
    <div class="fieldcontain ${hasErrors(bean: creditPaymentsInstance, field: 'payment', 'error')} required form-group">
        <label for="payment">
            Abono
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="payment" value="${fieldValue(bean: creditPaymentsInstance, field: 'payment')}" required="" class="form-control price"/>
    </div>
</div>
<div id="resultList">&nbsp;</div>
