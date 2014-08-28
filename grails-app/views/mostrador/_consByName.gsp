<ul class="resultList">
    <g:each in="${results}" var="res">
        <li><a href="#" onclick="$('#prodPriceQuery').text('$'+'${res.salePrice}');$('#consImg').attr('src','${resource(dir:'products',file: res.image)}');$('#cList').css('display','none');$('#cProduct').val('${res.product}');$('#cCode').val('');">${res.product}</a></li>
    </g:each>
</ul>
<script>
    $('#cList').css('display','block');

</script>