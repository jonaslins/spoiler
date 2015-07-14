
<%@ page import="spoiler.Movie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movie.label', default: 'Movie')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div class="container">
		<div>
			<ul class="nav nav-pills">
				<li role="presentation"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li role="presentation"><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li role="presentation"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-movie" class="content scaffold-show" role="main">
			<h1><g:fieldValue bean="${movieInstance}" field="name"/></h1>
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="list-group">
			
				<g:if test="${movieInstance?.releaseDate}">
				<li class="list-group-item">
					<span id="releaseDate-label" class="property-label"><g:message code="movie.releaseDate.label" default="Release Date" /></span>
					
						<span class="property-value" aria-labelledby="releaseDate-label"><g:formatDate date="${movieInstance?.releaseDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.grade}">
				<li class="list-group-item">
					<span id="grade-label" class="property-label"><g:message code="movie.grade.label" default="Grade" /></span>
					
						<span class="property-value" aria-labelledby="grade-label"><g:fieldValue bean="${movieInstance}" field="grade"/></span>
					
				</li>
				</g:if>

				<g:if test="${movieInstance?.synopsis}">
				<li class="list-group-item">
					<span id="synopsis-label" class="property-label"><g:message code="movie.synopsis.label" default="Synopsis" /></span>
					
						<span class="property-value" aria-labelledby="synopsis-label"><g:fieldValue bean="${movieInstance}" field="synopsis"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.actors}">
				<li class="list-group-item">
					<span id="actors-label" class="property-label"><g:message code="movie.actors.label" default="Actors" />:</span>
					
						<g:each in="${movieInstance.actors}" status="i" var="a">
						<span class="property-value" aria-labelledby="actors-label"><g:link controller="actor" action="show" id="${a.id}">${a?.name}${(i+1<movieInstance.actors.size())? ", ":""}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.directors}">
				<li class="list-group-item">
					<span id="directors-label" class="property-label"><g:message code="movie.directors.label" default="Directors" />:</span>
					
						<g:each in="${movieInstance.directors}" status="i " var="d">
						<span class="property-value" aria-labelledby="directors-label"><g:link controller="director" action="show" id="${d.id}">${d?.name}${(i+1<movieInstance.directors.size())? ", ":""}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.genres}">
				<li class="list-group-item">
					<span id="genres-label" class="property-label"><g:message code="movie.genres.label" default="Genres" />:</span>

						<g:each in="${movieInstance.genres}" status="i" var="g">
						<span class="property-value" aria-labelledby="genres-label"><g:link controller="genre" action="show" id="${g.id}">${g?.name}${(i+1<movieInstance.genres.size())? ", ":""}</g:link></span>
						</g:each>

				</li>
				</g:if>



			</ul>
			<g:form url="[resource:movieInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${movieInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</div>
	</body>
</html>
