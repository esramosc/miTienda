<%@ page import="mitienda.Region" %>



<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'region', 'error')} required">
	<label for="region">
		<g:message code="region.region.label" default="Region" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="region" required="" value="${regionInstance?.region}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="region.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${regionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'registerDate', 'error')} required">
	<label for="registerDate">
		<g:message code="region.registerDate.label" default="Register Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="registerDate" precision="day"  value="${regionInstance?.registerDate}"  />
</div>

