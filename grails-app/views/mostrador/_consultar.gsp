<div class="row">
    <div class="form-group">
        <label>Buscar por nombre del producto</label>
        <input type="text" id="cProduct" class="form-control" onkeyup="${remoteFunction(controller: 'mostrador', action: 'getByProd', update: [success: 'cList', failure: 'error'], params: ' \'name=\'+this.value')}"/>
        <div id="cList" style="position: relative;z-index: 2;"></div>
    </div>
</div>
<div class="row">
    <div class="form-group">
        <label>Buscar por c&oacute;digo del producto</label>
        <input type="text" id="cCode" class="form-control" onblur="${remoteFunction(controller: 'mostrador', action: 'getByCode', update: [success: 'cList2', failure: 'error'], params: ' \'name=\'+this.value')}"/>
        <div id="cList2" style="position: relative;z-index: 2;"></div>
    </div>
</div>
<div class="row" style="height: 170px;">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-4">
        <img src="${resource(dir:'products',file: 'no-photo.jpg')}" class="img-thumbnail" width="150" id="consImg"/>
    </div>
    <div class="col-md-4" style="margin-top: 35px;text-align: right;">
        <span id="prodPriceQuery" style="font-size: 30px;">$ 0.0</span>
    </div>
    <div class="col-md-1">&nbsp;</div>
</div>
