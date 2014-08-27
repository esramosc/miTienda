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
<div id="loginmodal" style="display:none;">
    <h1>Total de la venta</h1>
    <form id="loginform" name="loginform" method="post" action="completeSale">
        <input type="hidden" name="randomString" value="${session.randomString}"/>
        <input type="hidden" name="username" value="${session.username}"/>
        <input type="hidden" name="customerSaleId" id="customerSaleId" value="0"/>
        <label for="totalVenta">Total</label>
        <input type="text" name="totalVenta" id="totalVenta" class="txtfield" tabindex="1" value="0" readonly="">

        <label for="pago">Pago</label>
        <input type="text" name="pago" id="pago" class="txtfield" tabindex="2" value="0" required="required">

        <div class="center"><input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu" value="Enviar" tabindex="3" onclick="return validForm();"></div>
    </form>
</div>