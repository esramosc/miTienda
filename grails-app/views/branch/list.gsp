
<%@ page import="mitienda.Branch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'branch.label', default: 'Branch')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-branch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-branch" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="region" title="${message(code: 'branch.region.label', default: 'Region')}" />
					
						<g:sortableColumn property="branch" title="${message(code: 'branch.branch.label', default: 'Branch')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'branch.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'branch.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="registerDate" title="${message(code: 'branch.registerDate.label', default: 'Register Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${branchInstanceList}" status="i" var="branchInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${branchInstance.id}">${fieldValue(bean: branchInstance, field: "region")}</g:link></td>
					
						<td>${fieldValue(bean: branchInstance, field: "branch")}</td>
					
						<td>${fieldValue(bean: branchInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: branchInstance, field: "status")}</td>
					
						<td><g:formatDate date="${branchInstance.registerDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${branchInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
