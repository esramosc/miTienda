<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Mi Tienda</title>
	</head>
	<body>
        <div class="row">
            &nbsp;
        </div>
        <div class="row panel panel-warning">
            <div class="col-md-6">
                <p class="indexText">
                    SISTEMA PARA GESTI&Oacute;N DE MINI TIENDAS
                </p>
                <P>
                    <strong>FUNCIONES CON LAS QUE CUENTA:</strong> INVENTARIO, PROVEEDORES, VENTAS, CLIENTES, REPORTES.
                </P>
            </div>
            <div class="col-md-2">&nbsp;</div>
            <div class="col-md-4">
                <h3>Ingresar al sistema</h3>
                <g:link controller="login">
                    <img src="${resource(dir:'images',file:'ingresar.jpg')}"/>
                </g:link>
            </div>
        </div>
        <div class="row">
            &nbsp;
        </div>
		<div class="row">
            <div class="col-md-3">
                <div class="row">
                    <img src="${resource(dir:'images',file:'ventas.png')}" width="200px"/>
                </div>
            </div>
            <div class="col-md-3">
                <div class="row">
                    <img src="${resource(dir:'images',file:'proveedor.png')}" width="200px"/>
                </div>
            </div>
            <div class="col-md-3">
                <img src="${resource(dir:'images',file:'INVENTARIO.png')}" width="200px"/>
            </div>
            <div class="col-md-3">
                <img src="${resource(dir:'images',file:'reportes.png')}" width="200px"/>
            </div>
		</div>
	</body>
</html>
