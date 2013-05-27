<%@ page import="dd.project.wolverine.Team" %>



<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'unused', 'error')} ">
	<label for="unused">
		<g:message code="team.unused.label" default="Unused" />
		
	</label>
	<g:textField name="unused" value="${teamInstance?.unused}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'logoFile', 'error')} ">
	<label for="logoFile">
		<g:message code="team.logoFile.label" default="Logo File" />
		
	</label>
	<g:textField name="logoFile" value="${teamInstance?.logoFile}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'history', 'error')} ">
	<label for="history">
		<g:message code="team.history.label" default="History" />
		
	</label>
	<g:textField name="history" value="${teamInstance?.history}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'website', 'error')} ">
	<label for="website">
		<g:message code="team.website.label" default="Website" />
		
	</label>
	<g:textField name="website" value="${teamInstance?.website}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'directions', 'error')} ">
	<label for="directions">
		<g:message code="team.directions.label" default="Directions" />
		
	</label>
	<g:textField name="directions" value="${teamInstance?.directions}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'stadium', 'error')} ">
	<label for="stadium">
		<g:message code="team.stadium.label" default="Stadium" />
		
	</label>
	<g:textField name="stadium" value="${teamInstance?.stadium}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="team.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${teamInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'nickname', 'error')} required">
	<label for="nickname">
		<g:message code="team.nickname.label" default="Nickname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nickname" required="" value="${teamInstance?.nickname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="team.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${teamInstance?.city}"/>
</div>

