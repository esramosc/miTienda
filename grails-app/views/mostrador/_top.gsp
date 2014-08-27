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
