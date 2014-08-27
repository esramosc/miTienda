<ul class="resultList">
    <g:each in="${results}" var="res">
        <li><a href="#" onclick="$('#prodId').val('${res.id}');$('#prodName').val('${res.product}');$('#productList').css('display','none');${remoteFunction(controller: 'mostrador', action: 'searchProductById', update: [success: 'saleDetail2', failure: 'error'], params: ' \'id='+res.id+'&quantity=\'+document.getElementById(\'quantity2\').value')}">${res.product}</a></li>
    </g:each>
</ul>
<script>
    $('#productList').css('display','block');
</script>