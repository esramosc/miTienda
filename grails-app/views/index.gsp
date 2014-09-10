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
        <div class="row">
            <div class="col-md-1">&nbsp;</div>
            <div class="col-md-5">
                <p class="indexText">
                    SISTEMA PARA GESTI&Oacute;N DE MINI TIENDAS
                </p>
                <P>
                    <strong>FUNCIONES CON LAS QUE CUENTA:</strong>
                    <ul style="font-size: 16px;font-style: inherit;font-weight: bold;color: #6f6f6f;">
                        <li>INVENTARIO</li>
                        <li>PROVEEDORES</li>
                        <li>VENTAS</li>
                        <li>CLIENTES</li>
                        <li>REPORTES</li>
                    </ul>
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
        <div style="margin-left: 50px;">
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
        </div>
	</body>
</html>
