<script type="text/javascript">
    function validForm(){
        if($('#customerSaleId').val()==""){
            alert('Debe seleccionar un cliente');
            return false;
        }
        if(document.getElementById('totalVenta').value=="" || document.getElementById('totalVenta').value=="0"){
            alert("El total de la venta no puede ser cero");
            $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
            return false;
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
        <input type="hidden" name="customerSaleId" id="customerSaleId" value=""/>
        <label for="totalVenta">Total</label>
        <input type="text" name="totalVenta" id="totalVenta" class="txtfield" tabindex="1" value="0" readonly="">

        <div class="center"><input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu" value="Enviar" tabindex="3" onclick="return validForm();"></div>
    </form>
</div>
