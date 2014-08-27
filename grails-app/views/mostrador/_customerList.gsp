<ul class="resultList">
    <g:each in="${results}" var="res">
        <li><a href="#" onclick="document.getElementById('customer').value='${res.name} ${res.lastname}';document.getElementById('customerId').value='${res.id}';document.getElementById('customerList').style.display='none';document.getElementById('customerSaleId').value=${res.id}">${res.name} ${res.lastname}</a></li>
    </g:each>
</ul>
<script>
    $('#customerList').css('display','block');
</script>