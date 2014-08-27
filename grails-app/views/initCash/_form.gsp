<%@ page import="mitienda.InitCash" %>


<div class="row">
    <div class="fieldcontain ${hasErrors(bean: initCashInstance, field: 'amount', 'error')} required form-group">
        <label for="amount">
            Monto de apertura
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="amount" value="${fieldValue(bean: initCashInstance, field: 'amount')}" required="" class="price form-control"/>
    </div>
</div>



