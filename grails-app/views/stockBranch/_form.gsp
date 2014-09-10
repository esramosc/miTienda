<%@ page import="mitienda.StockBranch" %>


<div class="row">
    <div class="fieldcontain ${hasErrors(bean: stockBranchInstance, field: 'branchId', 'error')} required form-group">
        <label for="branchId">
            Sucursal
            <span class="required-indicator">*</span>
        </label>
        <select name="branchId" id="branchId" class="form-control" required="">
            <option value="">Seleccione</option>
            <g:each in="${branches}" var="br">
                <option value="${br.id}" <%if(br.id.toString()==stockBranchInstance.branchId){print "selected"}%> >${br.branch}</option>
            </g:each>
        </select>
    </div>
</div>
<div class="row">
    <div class="fieldcontain ${hasErrors(bean: stockBranchInstance, field: 'productId', 'error')} required form-group">
        <label for="productId">
            Producto
            <span class="required-indicator">*</span>
        </label>
        <input type="text" name="prodName" id="prodName" value="${prodName}" class="form-control" required="" autocomplete="off" onkeyup="${remoteFunction(controller: 'stockBranch', action: 'getProductsByName', update: [success: 'productList', failure: 'error'], params: ' \'name=\'+this.value')}"/>
        <input type="hidden" name="productId" id="productId" value="${stockBranchInstance?.productId}"/>
        <div id="productList" style="position: relative;z-index: 2;"></div>
    </div>
</div>
<div class="row">
    <div class="fieldcontain ${hasErrors(bean: stockBranchInstance, field: 'quantity', 'error')} required form-group">
        <label for="quantity">
            Cantidad en inventario
            <span class="required-indicator">*</span>
        </label>
        <input type="text" name="quantity" id="quantity" value="${fieldValue(bean: stockBranchInstance, field: 'quantity')}" required="" class="form-control price"/>
        <small>Cantidad de piezas o total de kilogramos</small>
    </div>
</div>


