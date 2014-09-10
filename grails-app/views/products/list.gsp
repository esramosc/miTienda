
<%@ page import="mitienda.Products" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-3">&nbsp;</div>
            <div class="col-md-6 alert alert-success">
                Introduce el nombre del producto a buscar:
                <input type="text" name="description" width="350px" class="input-sm" onkeyup="${remoteFunction(controller: 'products', action: 'searchByDesc', update: [success: 'productsList', failure: 'error'], params: ' \'description=\'+this.value')}"/>
            </div>
            <div class="col-md-3">&nbsp;</div>
        </div>
		<div class="row alert">
			<h3>Lista de productos</h3>
            <span id="productsList">
                <table class="table table-responsive table-bordered">
                    <thead>
                        <tr>

                            <g:sortableColumn property="category" title="Categor&iacute;a" />

                            <g:sortableColumn property="product" title="Producto" />

                            <g:sortableColumn property="description" title="Descripci&oacute;n" />

                            <g:sortableColumn property="buyPrice" title="Precio de compra" />

                            <g:sortableColumn property="salePrice" title="Precio de venta" />

                            <g:sortableColumn property="tax" title="IVA" />

                            <g:sortableColumn property="type" title="Tipo de unidad" />

                            <g:sortableColumn property="minQuantity" title="Cantidad m&iacute;nima" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productsInstanceList}" status="i" var="productsInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td>${fieldValue(bean: productsInstance, field: "category")}</td>

                            <td><g:link action="edit" id="${productsInstance.id}">${fieldValue(bean: productsInstance, field: "product")}</g:link></td>

                            <td>${fieldValue(bean: productsInstance, field: "description")}</td>

                            <td>${fieldValue(bean: productsInstance, field: "buyPrice")}</td>

                            <td>${fieldValue(bean: productsInstance, field: "salePrice")}</td>

                            <td>${fieldValue(bean: productsInstance, field: "tax")}</td>

                            <td>${fieldValue(bean: productsInstance, field: "type")}</td>

                            <td>${fieldValue(bean: productsInstance, field: "minQuantity")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <% if(productsInstanceTotal>10){ %>
                    <div class="pagination">
                        <g:paginate total="${productsInstanceTotal}" />
                    </div>
                <% } %>
            </span>
		</div>
	</body>
</html>
