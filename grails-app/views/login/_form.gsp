<%@ page import="mitienda.Login" %>



<div class="fieldcontain ${hasErrors(bean: loginInstance, field: 'name', 'error')} required form-group">
	<label for="name">
		Nombre de usuario
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${loginInstance?.name}" class="form-control"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loginInstance, field: 'password', 'error')} required form-group">
	<label for="password">
		Contrase&ntilde;a
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" required="" value="${loginInstance?.password}" class="form-control"/>
</div>

