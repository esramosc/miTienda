<script type="text/javascript">
    <% if(detail.flag){ %>
        $('#saleDetail tr:last').after('<tr id="row${detail.id}"><td>${detail.product}</td><td>${detail.price}</td><td>${detail.quantity}</td><td>${detail.total}</td></tr>');
        document.getElementById('quantity2').value = 1;
        document.getElementById('prodName').value = "";
        document.getElementById('prodId').value = "";
        $('#byName').css("display","none");
        $('#byCode').css("display","block");
        document.getElementById('quantity').value = 1;
        document.getElementById('productCode').value = "";
        document.getElementById('productCode').focus();
        $('#totalSale').text("$"+${totalTmp});
        $('#totalVenta').val(${totalTmp});
        $('#myImage').attr('src','${resource(dir:'products',file: detail.image)}');
        //document.getElementById('totalSale').innerHTML = '$ ${totalTmp}';




    <% }else{ %>
        alert("No se encontro un producto con ese código");
        document.getElementById('quantity2').value = 1;
        document.getElementById('prodName').value = "";
        document.getElementById('prodName').focus();
    <% } %>

</script>