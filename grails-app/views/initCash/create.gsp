<%@ page import="mitienda.InitCash" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert alert-warning">
            <div class="col-md-4">&nbsp;</div>
            <div class="col-md-4">
                <h3>Apertura de caja</h3>
                <g:hasErrors bean="${initCashInstance}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${initCashInstance}" var="error">
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
            <div class="col-md-4">&nbsp;</div>
		</div>
	</body>
</html>
