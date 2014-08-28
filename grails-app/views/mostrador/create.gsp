<%@ page import="mitienda.Mostrador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <link rel="stylesheet" href="${resource(dir:'css',file: 'styleModal.css')}" type="text/css"/>
        <style type="text/css">
            .resultList{
                font-size: 14px;
                font-style: italic;
                border:solid 1px #060605;
                background-color: #0909FF;
            }
            a:link {
                color: #FFF;
            }

                /* visited link */
            a:visited {
                color: #FFF;
            }

                /* mouse over link */
            a:hover {
                color: #dfe9ff;
            }

                /* selected link */
            a:active {
                color: #dfe9ff;
            }
        </style>
	</head>
	<body>
		<div class="row alert">
			<div class="col-md-8" style="height: 350px;overflow: auto;">
                <!--h5>Detalle de la venta</h5-->
                <div>
                    <table class="table table-bordered table-responsive" style="font-size: 12px;color: rgba(14,42,227,0.95)" id="saleDetail">
                        <tr style="font-weight: bold;background-color: rgb(255,251,226)">
                            <td>Producto</td>
                            <td>Precio</td>
                            <td>Cantidad</td>
                            <td>Total</td>
                        </tr>
                    </table>
                </div>
			</div>
            <div class="col-md-4">
                <div class="row alert alert-success">
                    <g:render template="top"/>
                </div>
                <div class="row">
                    <g:render template="bottom"/>
                </div>
            </div>
		</div>
        <div id="saleDetail2"></div>
        <script type="text/javascript" src="${resource(dir:'js',file:'jquery.leanModal.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js',file:'jquery.form.js')}"></script>
        <script type="text/javascript">
            $(function(){
                $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
            });
        </script>
        <script type="text/javascript">
            function openSearch(){
                $('#byCode').css( "display", "none");
                $('#ByQuery').css( "display", "none");
                $('#byName').css( "display", "block");
                $('#quantity2').focus();
            }
            function closeSearch(){
                $('#byName').css( "display", "none")
                $('#byCode').css( "display", "block");
                $('#ByQuery').css( "display", "none");
                $('#productCode').focus();
            }
            function openQuery(){
                $('#byName').css( "display", "none")
                $('#byCode').css( "display", "none");
                $('#ByQuery').css( "display", "block");
                //$('#productCode').focus();
            }
        </script>
	</body>
</html>
