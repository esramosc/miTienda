
<%@ page import="mitienda.CreditPayments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'creditPayments.label', default: 'CreditPayments')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-creditPayments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-creditPayments" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="customerId" title="${message(code: 'creditPayments.customerId.label', default: 'Customer Id')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'creditPayments.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="payment" title="${message(code: 'creditPayments.payment.label', default: 'Payment')}" />
					
						<g:sortableColumn property="tranDate" title="${message(code: 'creditPayments.tranDate.label', default: 'Tran Date')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'creditPayments.username.label', default: 'Username')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${creditPaymentsInstanceList}" status="i" var="creditPaymentsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${creditPaymentsInstance.id}">${fieldValue(bean: creditPaymentsInstance, field: "customerId")}</g:link></td>
					
						<td>${fieldValue(bean: creditPaymentsInstance, field: "amount")}</td>
					
						<td>${fieldValue(bean: creditPaymentsInstance, field: "payment")}</td>
					
						<td><g:formatDate date="${creditPaymentsInstance.tranDate}" /></td>
					
						<td>${fieldValue(bean: creditPaymentsInstance, field: "username")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${creditPaymentsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
