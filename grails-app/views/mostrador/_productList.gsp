<script type="text/javascript">
    <% if(detail.flag){ %>
        $('#saleDetail tr:last').after('<tr id="row${detail.id}"><td>${detail.product}</td><td>${detail.price}</td><td>${detail.quantity}</td><td>${detail.total}</td></tr>');
        $('#myImage').attr('src','${resource(dir:'products',file: detail.image)}');
        $('#totalSale').text("$"+${totalTmp});
        $('#totalVenta').val(${totalTmp});
        document.getElementById('quantity').value = 1;
        document.getElementById('productCode').value = "";
        document.getElementById('productCode').focus();

    <% }else{ %>
        alert("No se encontro un producto con ese código");
        document.getElementById('quantity').value = 1;
        document.getElementById('productCode').value = "";
        document.getElementById('productCode').focus();
    <% } %>
</script>