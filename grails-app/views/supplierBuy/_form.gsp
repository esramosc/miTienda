<%@ page import="mitienda.SupplierBuy" %>


<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: supplierBuyInstance, field: 'supplierId', 'error')} required form-group">
            <label for="supplierId">
                Proveedor
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="supplierAux" id="supplierAux" required="" value="${supplierBuyInstance?.supplierId}" class="form-control" onkeyup="${remoteFunction(controller: 'supplierBuy', action: 'getSupplier', update: [success: 'supplierList', failure: 'error'], params: ' \'name=\'+this.value')}" autocomplete="off"/>
            <input type="hidden" name="supplierId" id="supplierId" value=""/>
            <div id="supplierList" style="position: relative;z-index: 2;"></div>
            <small>Ingrese el nombre del proveedor y seleccionelo</small>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: supplierBuyInstance, field: 'buyDescription', 'error')} required form-group">
            <label for="buyDescription">
                Descripci&oacute;n de la compra
                <span class="required-indicator">*</span>
            </label>
            <g:textArea name="buyDescription" required="" value="${supplierBuyInstance?.buyDescription}" class="form-control"/>
        </div>
    </div>
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: supplierBuyInstance, field: 'buyAmount', 'error')} required form-group">
            <label for="buyAmount">
                Monto de la compra
                <span class="required-indicator">*</span>
            </label>
            <g:textField name="buyAmount" value="${fieldValue(bean: supplierBuyInstance, field: 'buyAmount')}" required="" class="form-control price"/>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-4">
        <div class="fieldcontain ${hasErrors(bean: supplierBuyInstance, field: 'buyType', 'error')} required form-group">
            <label for="buyType">
                Tipo de compra
                <span class="required-indicator">*</span>
            </label>
            <select name="buyType" id="buyType" class="form-control" required="">
                <option value="">Seleccione</option>
                <option value="CONTADO" <%if(supplierBuyInstance.buyType=="CONTADO"){print "selected"}%>  >CONTADO</option>
                <option value="CREDITO" <%if(supplierBuyInstance.buyType=="CREDITO"){print "selected"}%>  >CREDITO</option>
            </select>
        </div>
    </div>
    <div class="col-md-4">

    </div>
    <div class="col-md-4">

    </div>
</div>