<%@ page import="mitienda.SupplierPayment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
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
		<div class="row">
            <div class="col-md-3">&nbsp;</div>
            <div class="col-md-6">
                <h3>Pagos a proveedores</h3>
                <g:hasErrors bean="${supplierPaymentInstance}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${supplierPaymentInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <g:form action="save" >
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-success" value="Enviar" onclick="return validForm();"/>
                    </fieldset>
                </g:form>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
        <script>
            function validForm(){
                var payment = parseFloat($('#payment').val());
                var actualAmount = parseFloat($('#actualAmount').val());
                //alert("payment: "+payment);
                //alert("actualAmount: "+actualAmount);

                supplier = $('#supplierId').val();
                if(supplier==""){
                    alert('Debe seleccionar al proveedor');
                    return false;
                }
                if(payment<=0){
                    alert("Ingrese el monto del abono");
                    return false;
                }
                if(payment>actualAmount){
                    alert("El abono ingresado es mayor al monto total de la deuda");
                    return false;
                }
            }
        </script>
	</body>
</html>
