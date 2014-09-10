<ul class="resultList">
    <g:each in="${results}" var="res">
        <li><a href="#" onclick="$('#productId').val('${res.id}');$('#prodName').val('${res.product}');$('#productList').css('display','none');">${res.product}</a></li>
    </g:each>
</ul>
<script>
    $('#productList').css('display','block');
</script>