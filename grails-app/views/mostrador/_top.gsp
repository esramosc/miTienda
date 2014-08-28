<script type="text/javascript">
    function validForm(){
        if(document.getElementById('pago').value==""){
            alert("Introduzca el pago");
            $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
            return false;
        }else{
            var total = document.getElementById('totalVenta').value;
            var a = parseFloat(total);
            var pago = document.getElementById('pago').value;
            var b = parseFloat(pago)
            if(b<a){
                alert("El monto del pago debe ser mayor al total de la compra");
                return false;
            }
        }
    }
</script>
<div id="byCode">
    <g:render template="byCode"/>
</div>
<div id="byName" style="display: none;">
    <g:render template="byName"/>
</div>
<div id="ByQuery" style="display: none;">
    <g:render template="consultar"/>
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
