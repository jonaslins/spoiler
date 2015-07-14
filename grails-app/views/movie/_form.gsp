<%@ page import="spoiler.Movie" %>



<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'releaseDate', 'error')} ">
	<label for="releaseDate">
		<g:message code="movie.releaseDate.label" default="Release Date" />
		
	</label>
	<g:datePicker name="releaseDate" precision="day"  value="${movieInstance?.releaseDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'grade', 'error')} ">
	<label for="grade">
		<g:message code="movie.grade.label" default="Grade" />
		
	</label>
	<g:field name="grade" value="${fieldValue(bean: movieInstance, field: 'grade')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'synopsis', 'error')} ">
	<label for="synopsis">
		<g:message code="movie.synopsis.label" default="Synopsis" />
		
	</label>
	<g:textField name="synopsis" value="${movieInstance?.synopsis}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'actors', 'error')} ">
	<label for="actors">
		<g:message code="movie.actors.label" default="Actors" />
		
	</label>
	<g:select name="actors" from="${spoiler.Actor.list()}" multiple="multiple" optionKey="id" size="5" value="${movieInstance?.actors*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'directors', 'error')} ">
	<label for="directors">
		<g:message code="movie.directors.label" default="Directors" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'genres', 'error')} ">
	<label for="genres">
		<g:message code="movie.genres.label" default="Genres" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="movie.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${movieInstance?.name}"/>

</div>

