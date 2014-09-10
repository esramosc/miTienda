
<%@ page import="mitienda.StockBranch" %>
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
                <input type="text" name="description" width="350px" class="input-sm" onkeyup="${remoteFunction(controller: 'stockBranch', action: 'searchByDesc', update: [success: 'productsList', failure: 'error'], params: ' \'description=\'+this.value')}"/>
            </div>
            <div class="col-md-3">&nbsp;</div>
        </div>
		<div class="row">
            <div class="col-md-1">&nbsp;</div>
            <div class="col-md-10">
                <h3>Lista de productos por sucursal</h3>
                <table class="table table-responsive table-bordered">
                    <thead>
                        <tr>

                            <g:sortableColumn property="branchId" title="Sucursal" />

                            <g:sortableColumn property="productId" title="Producto" />

                            <g:sortableColumn property="quantity" title="Cantidad" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${stockBranchInstanceList}" status="i" var="stockBranchInstance">
                        <tr class="${(i % 2) == 0 ? 'info' : 'default'}">

                            <td>${fieldValue(bean: stockBranchInstance, field: "branchId")}</td>

                            <td><g:link action="edit" id="${stockBranchInstance.id}">${fieldValue(bean: stockBranchInstance, field: "productId")}</g:link></td>

                            <td>${fieldValue(bean: stockBranchInstance, field: "quantity")}</td>



                        </tr>
                    </g:each>
                    </tbody>
                </table>

                <% if(stockBranchInstanceTotal > 10){ %>
                <div class="pagination">
                    <g:paginate total="${stockBranchInstanceTotal}" />
                </div>
                <% } %>
            </div>
            <div class="col-md-1">&nbsp;</div>
		</div>
	</body>
</html>
