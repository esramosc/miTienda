<%@ page import="mitienda.CreditPayments" %>
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
                <h1>Abono a la cuenta a credito</h1>
                <g:hasErrors bean="${creditPaymentsInstance}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${creditPaymentsInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <g:if test="${error}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                                <li>${error}</li>
                        </ul>
                    </div>
                </g:if>
                <g:form action="save" >
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-success" value="Enviar" />
                    </fieldset>
                </g:form>
            </div>
            <div class="col-md-3">&nbsp;</div>
		</div>
	</body>
</html>
