<script type="text/javascript">
    <% if(flag){ %>
        $('#prodPriceQuery').text("$"+${results.salePrice});
        $('#consImg').attr('src','${resource(dir:'products',file: results.image)}');
        $('#cProduct').val('${results.product}');
    <% }else{ %>
        alert("No se encontro un producto con ese código");
        $('#prodPriceQuery').text("$0.0");
        $('#consImg').attr('src','${resource(dir:'products',file: 'no-photo.jpg')}');
        $('#cProduct').val('');
    <% } %>
</script>