
<%@ page import="spoiler.Actor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'actor.label', default: 'Actor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-actor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-actor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'actor.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="birthday" title="${message(code: 'actor.birthday.label', default: 'Birthday')}" />
					
						<g:sortableColumn property="information" title="${message(code: 'actor.information.label', default: 'Information')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${actorInstanceList}" status="i" var="actorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${actorInstance.id}">${fieldValue(bean: actorInstance, field: "name")}</g:link></td>
					
						<td><g:formatDate date="${actorInstance.birthday}" /></td>
					
						<td>${fieldValue(bean: actorInstance, field: "information")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${actorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
