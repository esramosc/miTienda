<%@ page import="mitienda.SupplierPayment" %>


<div class="row">
    <div class="col-md-8">
        <div class="fieldcontain ${hasErrors(bean: supplierPaymentInstance, field: 'supplierId', 'error')} required form-group">
            <label for="supplierId">
                Proveedor
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="supplierAux" id="supplierAux" required="required" value="${supplierPaymentInstance?.supplierId}" class="form-control" onkeyup="${remoteFunction(controller: 'supplierPayment', action: 'getSupplier', update: [success: 'supplierList', failure: 'error'], params: ' \'name=\'+this.value')}" autocomplete="off"/>
            <input type="hidden" name="supplierId" id="supplierId" value=""/>
            <div id="supplierList" style="position: relative;z-index: 2;"></div>
            <small>Ingrese el nombre del proveedor y seleccionelo</small>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-8">
        <input type="hidden" name="actualAmount" id="actualAmount"/>
        <span id="paymentLabel" style="font-size: 24px;font-weight: bold;">Monto actual: $0.0</span>
    </div>
</div>
<div class="row">&nbsp;</div>
<div class="row">
    <div class="col-md-8">
        <div class="fieldcontain ${hasErrors(bean: supplierPaymentInstance, field: 'payment', 'error')} required form-group">
            <label for="payment">
                Abono
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="payment" value="${fieldValue(bean: supplierPaymentInstance, field: 'payment')}" required="" class="form-control price"/>
        </div>
    </div>
    <div class="col-md-6">

    </div>
</div>
<div id="supplierData">&nbsp;</div>







