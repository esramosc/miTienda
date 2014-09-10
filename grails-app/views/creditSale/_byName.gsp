<div class="row">
    <div class="col-md-4">
        <div class="form-group">
            <label>Cantidad: </label>
            <input type="text" name="quantity2" id="quantity2" value="1" class="form-control number"/>
        </div>
    </div>
    <div class="col-md-8">
        &nbsp;
    </div>
</div>
<div class="row">
    <div class="form-group">
        <label>Nombre del producto: </label>
        <input type="text" id="prodName" class="form-control" autocomplete="off" onkeyup="${remoteFunction(controller: 'mostrador', action: 'getProductsByName', update: [success: 'productList', failure: 'error'], params: ' \'name=\'+this.value')}"/>
        <input type="hidden" name="prodId" id="prodId"/>
        <div id="productList" style="position: relative;z-index: 2;"></div>
    </div>
</div>
<div class="row" style="height: 170px;">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-5">
        &nbsp;
    </div>
    <div class="col-md-3" style="margin-top: 35px;text-align: right;">
        &nbsp;
    </div>
    <div class="col-md-1">&nbsp;</div>
</div>
