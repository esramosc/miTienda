<ul class="resultList">
    <g:each in="${results}" var="res">
        <li><a href="#" onclick="document.getElementById('customerName').value='${res.name} ${res.lastname}';document.getElementById('customerId').value='${res.id}';document.getElementById('customerList').style.display='none';${remoteFunction(controller: 'creditPayments', action: 'getDebt', update: [success: 'resultList', failure: 'error'], params: ' \'customerId='+res.id+'\'')}">${res.name} ${res.lastname}</a></li>
    </g:each>
</ul>
<script>
    $('#customerList').css('display','block');
</script>