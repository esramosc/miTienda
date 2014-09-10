<ul class="resultList">
    <g:each in="${results}" var="res">
        <li><a href="#" onclick="$('#supplierId').val('${res.id}');$('#supplierAux').val('${res.enterprise}');$('#supplierList').css('display','none');">${res.enterprise}</a></li>
    </g:each>
</ul>
<script>
    $('#supplierList').css("display","block");
</script>