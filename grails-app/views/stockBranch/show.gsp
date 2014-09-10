
<%@ page import="mitienda.StockBranch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row">
            <div class="col-md-3">&nbsp;</div>
            <div class="col-md-6">
			<h3>Datos agregados</h3>
                <ul class="list-group">

                    <g:if test="${stockBranchInstance?.branchId}">
                        <li class="list-group-item">
                            <span id="branchId-label" class="property-label"><strong>Sucursal: </strong></span>

                            <span class="property-value" aria-labelledby="branchId-label">${branchName}</span>

                        </li>
                    </g:if>

                    <g:if test="${stockBranchInstance?.productId}">
                    <li class="list-group-item">
                        <span id="productId-label" class="property-label"><strong>Producto: </strong></span>

                            <span class="property-value" aria-labelledby="productId-label">${prodName}</span>

                    </li>
                    </g:if>

                    <g:if test="${stockBranchInstance?.quantity}">
                    <li class="list-group-item">
                        <span id="quantity-label" class="property-label"><strong>Cantidad: </strong></span>

                            <span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${stockBranchInstance}" field="quantity"/></span>

                    </li>
                    </g:if>



                </ul>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
