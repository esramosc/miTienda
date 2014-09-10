
<%@ page import="mitienda.SupplierPayment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'supplierPayment.label', default: 'SupplierPayment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-supplierPayment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-supplierPayment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="supplierId" title="${message(code: 'supplierPayment.supplierId.label', default: 'Supplier Id')}" />
					
						<g:sortableColumn property="actualAmount" title="${message(code: 'supplierPayment.actualAmount.label', default: 'Actual Amount')}" />
					
						<g:sortableColumn property="payment" title="${message(code: 'supplierPayment.payment.label', default: 'Payment')}" />
					
						<g:sortableColumn property="registerDate" title="${message(code: 'supplierPayment.registerDate.label', default: 'Register Date')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'supplierPayment.username.label', default: 'Username')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${supplierPaymentInstanceList}" status="i" var="supplierPaymentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${supplierPaymentInstance.id}">${fieldValue(bean: supplierPaymentInstance, field: "supplierId")}</g:link></td>
					
						<td>${fieldValue(bean: supplierPaymentInstance, field: "actualAmount")}</td>
					
						<td>${fieldValue(bean: supplierPaymentInstance, field: "payment")}</td>
					
						<td><g:formatDate date="${supplierPaymentInstance.registerDate}" /></td>
					
						<td>${fieldValue(bean: supplierPaymentInstance, field: "username")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${supplierPaymentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
