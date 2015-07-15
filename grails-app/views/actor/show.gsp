
<%@ page import="spoiler.Actor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'actor.label', default: 'Actor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
		<ul class="nav nav-pills">
			<li role="presentation"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li role="presentation"><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			<li role="presentation"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
		</ul>
		<div id="show-actor" class="content scaffold-show" role="main">
			<h1><g:fieldValue bean="${actorInstance}" field="name"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="list-group">

				<g:if test="${actorInstance?.movies}">
				<li class="list-group-item">
					<span id="movies-label" class="property-label"><g:message code="actor.movies.label" default="Movies" /></span>
					
						<g:each in="${actorInstance.movies}" status="i" var="m">
						<span class="property-value" aria-labelledby="movies-label"><g:link controller="movie" action="show" id="${m.id}">${m?.name}${(i+1<actorInstance.movies.size())? ", ":""}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${actorInstance?.series}">
				<li class="list-group-item">
					<span id="series-label" class="property-label"><g:message code="actor.series.label" default="Series" /></span>
					
						<g:each in="${actorInstance.series}" status="i" var="s">
						<span class="property-value" aria-labelledby="series-label"><g:link controller="serie" action="show" id="${s.id}">${s?.name}${(i+1<actorInstance.series.size())? ", ":""}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ul>
			<g:form url="[resource:actorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${actorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</div>
	</body>
</html>
