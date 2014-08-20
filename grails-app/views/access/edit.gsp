<%@ page import="mitienda.Access" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
        <script src="${resource(dir:'js',file:'functions.js')}"/>
        <script type="text/javascript">
            <%
                if(errorSubcat!=""){
                    print "alert('Select a Category Id.');"
                }
            %>
        </script>
	</head>
	<body>
		<div class="row alert alert-warning">
            <div class="col-md-2">&nbsp;</div>
            <div class="col-md-8">
                <h3>Editar acceso</h3>
                <g:hasErrors bean="${accessInstance}">
                    <div class="alert alert-success">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${accessInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
                <g:form method="post" >
                    <g:hiddenField name="id" value="${accessInstance?.id}" />
                    <g:hiddenField name="version" value="${accessInstance?.version}" />
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
        <script>
            $(document).ready(function () {

                $('#category').change(function () {
                    var selectoption = $(this).find('option:selected');
                    /*  alert(selectoption.text());  */
                    if (selectoption.text() == "SI") {
                        $('#control').val("#");
                        $('#act').val("#");

                    }

                    else {
                        $('#control').val("");
                        $('#act').val("");

                    }

                });
            });

        </script>
	</body>
</html>
