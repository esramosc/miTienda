<div class="row">
    <div class="form-group">
        <label>Cliente: </label>
        <input type="text" name="customer" id="customer" class="form-control" onkeyup="${remoteFunction(controller: 'mostrador', action: 'getCustomers', update: [success: 'customerList', failure: 'error'], params: ' \'name=\'+this.value')}"/>
        <input type="hidden" name="customerId" id="customerId" value="0"/>
        <div id="customerList" style="position: relative;z-index: 2;"></div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="form-group">
            <label>Cantidad: </label>
            <input type="text" name="quantity" id="quantity" value="1" class="form-control number"/>
        </div>
    </div>
    <div class="col-md-8">
        <div class="form-group">
            <label>C&oacute;digo del producto: </label>
            <input type="text" name="productCode" id="productCode" class="form-control" onblur="${remoteFunction(controller: 'mostrador', action: 'searchProduct', update: [success: 'saleDetail2', failure: 'error'], params: ' \'code=\'+this.value+\'&quantity=\'+document.getElementById(\'quantity\').value')}"/>
        </div>
    </div>
</div>
<div class="row" style="height: 170px;">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-5">
        <img src="${resource(dir:'products',file: 'no-photo.jpg')}" class="img-thumbnail" width="150px" id="myImage"/>
    </div>
    <div class="col-md-3" style="margin-top: 35px;text-align: right;">
        <label style="font-size: 40px;" id="totalSale">$0.00</label>
    </div>
    <div class="col-md-1">&nbsp;</div>
</div>
