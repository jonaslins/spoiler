<%@ page import="spoiler.Genre" %>



<div class="fieldcontain ${hasErrors(bean: genreInstance, field: 'movies', 'error')} ">
	<label for="movies">
		<g:message code="genre.movies.label" default="Movies" />
		
	</label>
	<g:select name="movies" from="${spoiler.Movie.list()}" multiple="multiple" optionKey="id" size="5" value="${genreInstance?.movies*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: genreInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="genre.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${genreInstance?.name}"/>

</div>

