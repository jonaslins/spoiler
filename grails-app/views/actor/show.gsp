
<%@ page import="spoiler.Actor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'actor.label', default: 'Actor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-actor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-actor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list actor">
			
				<g:if test="${actorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="actor.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${actorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actorInstance?.birthday}">
				<li class="fieldcontain">
					<span id="birthday-label" class="property-label"><g:message code="actor.birthday.label" default="Birthday" /></span>
					
						<span class="property-value" aria-labelledby="birthday-label"><g:formatDate date="${actorInstance?.birthday}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${actorInstance?.information}">
				<li class="fieldcontain">
					<span id="information-label" class="property-label"><g:message code="actor.information.label" default="Information" /></span>
					
						<span class="property-value" aria-labelledby="information-label"><g:fieldValue bean="${actorInstance}" field="information"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actorInstance?.movies}">
				<li class="fieldcontain">
					<span id="movies-label" class="property-label"><g:message code="actor.movies.label" default="Movies" /></span>
					
						<g:each in="${actorInstance.movies}" var="m">
						<span class="property-value" aria-labelledby="movies-label"><g:link controller="movie" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${actorInstance?.series}">
				<li class="fieldcontain">
					<span id="series-label" class="property-label"><g:message code="actor.series.label" default="Series" /></span>
					
						<g:each in="${actorInstance.series}" var="s">
						<span class="property-value" aria-labelledby="series-label"><g:link controller="serie" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:actorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${actorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
