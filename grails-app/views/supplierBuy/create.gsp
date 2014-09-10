<%@ page import="mitienda.SupplierBuy" %>
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
		<div class="row alert">
			<h3>Compra a proveedor</h3>
			<g:hasErrors bean="${supplierBuyInstance}">
                <div class="alert alert-success">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${supplierBuyInstance}" var="error">
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
					<g:submitButton name="create" class="btn btn-success" value="Enviar" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
