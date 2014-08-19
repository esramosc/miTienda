<%@ page import="mitienda.Branch" %>



<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'region', 'error')} required">
	<label for="region">
		<g:message code="branch.region.label" default="Region" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="region" required="" value="${branchInstance?.region}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="branch.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="branch" required="" value="${branchInstance?.branch}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="branch.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${branchInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="branch.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${branchInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'registerDate', 'error')} ">
	<label for="registerDate">
		<g:message code="branch.registerDate.label" default="Register Date" />
		
	</label>
	<g:datePicker name="registerDate" precision="day"  value="${branchInstance?.registerDate}" default="none" noSelection="['': '']" />
</div>

