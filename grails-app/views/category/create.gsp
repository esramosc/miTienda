<%@ page import="mitienda.Category" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert alert-warning">
            <div class="col-md-2">&nbsp;</div>
            <div class="col-md-8">
                <h3>Agregar categor&iacute;a</h3>
                <g:hasErrors bean="${categoryInstance}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${categoryInstance}" var="error">
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
            <div class="col-md-2">&nbsp;</div>
		</div>
	</body>
</html>
