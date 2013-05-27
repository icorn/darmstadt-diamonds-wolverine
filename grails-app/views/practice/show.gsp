
<%@ page import="dd.project.wolverine.Practice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'practice.label', default: 'Practice')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-practice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-practice" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list practice">
			
				<g:if test="${practiceInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="practice.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="practiceCategory" action="show" id="${practiceInstance?.category?.id}">${practiceInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${practiceInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="practice.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${practiceInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${practiceInstance?.day}">
				<li class="fieldcontain">
					<span id="day-label" class="property-label"><g:message code="practice.day.label" default="Day" /></span>
					
						<span class="property-value" aria-labelledby="day-label"><g:fieldValue bean="${practiceInstance}" field="day"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${practiceInstance?.starttime}">
				<li class="fieldcontain">
					<span id="starttime-label" class="property-label"><g:message code="practice.starttime.label" default="Starttime" /></span>
					
						<span class="property-value" aria-labelledby="starttime-label"><g:fieldValue bean="${practiceInstance}" field="starttime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${practiceInstance?.endtime}">
				<li class="fieldcontain">
					<span id="endtime-label" class="property-label"><g:message code="practice.endtime.label" default="Endtime" /></span>
					
						<span class="property-value" aria-labelledby="endtime-label"><g:fieldValue bean="${practiceInstance}" field="endtime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${practiceInstance?.facility}">
				<li class="fieldcontain">
					<span id="facility-label" class="property-label"><g:message code="practice.facility.label" default="Facility" /></span>
					
						<span class="property-value" aria-labelledby="facility-label"><g:link controller="homeStadium" action="show" id="${practiceInstance?.facility?.id}">${practiceInstance?.facility?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${practiceInstance?.facilityName}">
				<li class="fieldcontain">
					<span id="facilityName-label" class="property-label"><g:message code="practice.facilityName.label" default="Facility Name" /></span>
					
						<span class="property-value" aria-labelledby="facilityName-label"><g:fieldValue bean="${practiceInstance}" field="facilityName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${practiceInstance?.id}" />
					<g:link class="edit" action="edit" id="${practiceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
