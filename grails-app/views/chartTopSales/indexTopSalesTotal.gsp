<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
</head>
<body>
<div class="row alert">
    <div class="col-md-3">&nbsp;</div>
    <div class="col-md-6">
        <h3>Los 5 productos m&aacute;s vendidos por pieza</h3>
        <g:form action="topSalesTotal" method="post">
            <div class="form-group">
                <label>Sucursal</label>
                <select name="branchId" required="" class="form-control">
                    <option value="">Seleccione</option>
                    <g:each in="${branches}" var="br">
                        <option value="${br.id}">${br.branch}</option>
                    </g:each>
                </select>
            </div>
            <div class="buttons">
                <input type="submit" class="btn btn-success" value="Enviar"/>
            </div>
        </g:form>
    </div>
    <div class="col-md-3">&nbsp;</div>
</div>
</body>
</html>
