<%@ page import="mitienda.Role" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row alert alert-warning">
            <div class="col-md-2">&nbsp;</div>
            <div class="col-md-8">
                <h3>Editar Rol</h3>
                <g:hasErrors bean="${roleInstance}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${roleInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <g:form method="post" >
                    <g:hiddenField name="id" value="${roleInstance?.id}" />
                    <g:hiddenField name="version" value="${roleInstance?.version}" />
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:actionSubmit class="btn btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                </g:form>
            </div>
            <div class="col-md-2">&nbsp;</div>
		</div>
	</body>
</html>
