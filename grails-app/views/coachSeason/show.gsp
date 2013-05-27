
<%@ page import="dd.project.wolverine.CoachSeason" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'coachSeason.label', default: 'CoachSeason')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-coachSeason" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-coachSeason" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list coachSeason">
			
				<g:if test="${coachSeasonInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="coachSeason.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="coachCategory" action="show" id="${coachSeasonInstance?.category?.id}">${coachSeasonInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${coachSeasonInstance?.coach}">
				<li class="fieldcontain">
					<span id="coach-label" class="property-label"><g:message code="coachSeason.coach.label" default="Coach" /></span>
					
						<span class="property-value" aria-labelledby="coach-label"><g:link controller="coach" action="show" id="${coachSeasonInstance?.coach?.id}">${coachSeasonInstance?.coach?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${coachSeasonInstance?.season}">
				<li class="fieldcontain">
					<span id="season-label" class="property-label"><g:message code="coachSeason.season.label" default="Season" /></span>
					
						<span class="property-value" aria-labelledby="season-label"><g:fieldValue bean="${coachSeasonInstance}" field="season"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coachSeasonInstance?.sort}">
				<li class="fieldcontain">
					<span id="sort-label" class="property-label"><g:message code="coachSeason.sort.label" default="Sort" /></span>
					
						<span class="property-value" aria-labelledby="sort-label"><g:fieldValue bean="${coachSeasonInstance}" field="sort"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${coachSeasonInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="coachSeason.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${coachSeasonInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${coachSeasonInstance?.id}" />
					<g:link class="edit" action="edit" id="${coachSeasonInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
