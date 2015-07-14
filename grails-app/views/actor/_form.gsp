<%@ page import="spoiler.Actor" %>



<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="actor.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${actorInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'birthday', 'error')} ">
	<label for="birthday">
		<g:message code="actor.birthday.label" default="Birthday" />
		
	</label>
	<g:datePicker name="birthday" precision="day"  value="${actorInstance?.birthday}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'information', 'error')} ">
	<label for="information">
		<g:message code="actor.information.label" default="Information" />
		
	</label>
	<g:textField name="information" value="${actorInstance?.information}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'movies', 'error')} ">
	<label for="movies">
		<g:message code="actor.movies.label" default="Movies" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'series', 'error')} ">
	<label for="series">
		<g:message code="actor.series.label" default="Series" />
		
	</label>
	

</div>

