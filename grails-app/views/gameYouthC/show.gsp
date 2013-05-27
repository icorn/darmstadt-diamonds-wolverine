
<%@ page import="dd.project.wolverine.GameYouthC" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gameYouthC.label', default: 'GameYouthC')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gameYouthC" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gameYouthC" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gameYouthC">
			
				<g:if test="${gameYouthCInstance?.opponentStadium}">
				<li class="fieldcontain">
					<span id="opponentStadium-label" class="property-label"><g:message code="gameYouthC.opponentStadium.label" default="Opponent Stadium" /></span>
					
						<span class="property-value" aria-labelledby="opponentStadium-label"><g:fieldValue bean="${gameYouthCInstance}" field="opponentStadium"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="gameYouthC.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${gameYouthCInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="gameYouthC.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:fieldValue bean="${gameYouthCInstance}" field="time"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.homeStadium}">
				<li class="fieldcontain">
					<span id="homeStadium-label" class="property-label"><g:message code="gameYouthC.homeStadium.label" default="Home Stadium" /></span>
					
						<span class="property-value" aria-labelledby="homeStadium-label"><g:link controller="homeStadium" action="show" id="${gameYouthCInstance?.homeStadium?.id}">${gameYouthCInstance?.homeStadium?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.homeTeamName}">
				<li class="fieldcontain">
					<span id="homeTeamName-label" class="property-label"><g:message code="gameYouthC.homeTeamName.label" default="Home Team Name" /></span>
					
						<span class="property-value" aria-labelledby="homeTeamName-label"><g:fieldValue bean="${gameYouthCInstance}" field="homeTeamName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.guestTeamName}">
				<li class="fieldcontain">
					<span id="guestTeamName-label" class="property-label"><g:message code="gameYouthC.guestTeamName.label" default="Guest Team Name" /></span>
					
						<span class="property-value" aria-labelledby="guestTeamName-label"><g:fieldValue bean="${gameYouthCInstance}" field="guestTeamName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.preview}">
				<li class="fieldcontain">
					<span id="preview-label" class="property-label"><g:message code="gameYouthC.preview.label" default="Preview" /></span>
					
						<span class="property-value" aria-labelledby="preview-label"><g:fieldValue bean="${gameYouthCInstance}" field="preview"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.report}">
				<li class="fieldcontain">
					<span id="report-label" class="property-label"><g:message code="gameYouthC.report.label" default="Report" /></span>
					
						<span class="property-value" aria-labelledby="report-label"><g:fieldValue bean="${gameYouthCInstance}" field="report"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="gameYouthC.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="gameCategory" action="show" id="${gameYouthCInstance?.category?.id}">${gameYouthCInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.imageDir}">
				<li class="fieldcontain">
					<span id="imageDir-label" class="property-label"><g:message code="gameYouthC.imageDir.label" default="Image Dir" /></span>
					
						<span class="property-value" aria-labelledby="imageDir-label"><g:fieldValue bean="${gameYouthCInstance}" field="imageDir"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.ddPictureUrl}">
				<li class="fieldcontain">
					<span id="ddPictureUrl-label" class="property-label"><g:message code="gameYouthC.ddPictureUrl.label" default="Dd Picture Url" /></span>
					
						<span class="property-value" aria-labelledby="ddPictureUrl-label"><g:fieldValue bean="${gameYouthCInstance}" field="ddPictureUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.homeScore}">
				<li class="fieldcontain">
					<span id="homeScore-label" class="property-label"><g:message code="gameYouthC.homeScore.label" default="Home Score" /></span>
					
						<span class="property-value" aria-labelledby="homeScore-label"><g:fieldValue bean="${gameYouthCInstance}" field="homeScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.homeQ1}">
				<li class="fieldcontain">
					<span id="homeQ1-label" class="property-label"><g:message code="gameYouthC.homeQ1.label" default="Home Q1" /></span>
					
						<span class="property-value" aria-labelledby="homeQ1-label"><g:fieldValue bean="${gameYouthCInstance}" field="homeQ1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.homeQ2}">
				<li class="fieldcontain">
					<span id="homeQ2-label" class="property-label"><g:message code="gameYouthC.homeQ2.label" default="Home Q2" /></span>
					
						<span class="property-value" aria-labelledby="homeQ2-label"><g:fieldValue bean="${gameYouthCInstance}" field="homeQ2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.homeQ3}">
				<li class="fieldcontain">
					<span id="homeQ3-label" class="property-label"><g:message code="gameYouthC.homeQ3.label" default="Home Q3" /></span>
					
						<span class="property-value" aria-labelledby="homeQ3-label"><g:fieldValue bean="${gameYouthCInstance}" field="homeQ3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.homeQ4}">
				<li class="fieldcontain">
					<span id="homeQ4-label" class="property-label"><g:message code="gameYouthC.homeQ4.label" default="Home Q4" /></span>
					
						<span class="property-value" aria-labelledby="homeQ4-label"><g:fieldValue bean="${gameYouthCInstance}" field="homeQ4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.homeOt}">
				<li class="fieldcontain">
					<span id="homeOt-label" class="property-label"><g:message code="gameYouthC.homeOt.label" default="Home Ot" /></span>
					
						<span class="property-value" aria-labelledby="homeOt-label"><g:fieldValue bean="${gameYouthCInstance}" field="homeOt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.guestScore}">
				<li class="fieldcontain">
					<span id="guestScore-label" class="property-label"><g:message code="gameYouthC.guestScore.label" default="Guest Score" /></span>
					
						<span class="property-value" aria-labelledby="guestScore-label"><g:fieldValue bean="${gameYouthCInstance}" field="guestScore"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.guestQ1}">
				<li class="fieldcontain">
					<span id="guestQ1-label" class="property-label"><g:message code="gameYouthC.guestQ1.label" default="Guest Q1" /></span>
					
						<span class="property-value" aria-labelledby="guestQ1-label"><g:fieldValue bean="${gameYouthCInstance}" field="guestQ1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.guestQ2}">
				<li class="fieldcontain">
					<span id="guestQ2-label" class="property-label"><g:message code="gameYouthC.guestQ2.label" default="Guest Q2" /></span>
					
						<span class="property-value" aria-labelledby="guestQ2-label"><g:fieldValue bean="${gameYouthCInstance}" field="guestQ2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.guestQ3}">
				<li class="fieldcontain">
					<span id="guestQ3-label" class="property-label"><g:message code="gameYouthC.guestQ3.label" default="Guest Q3" /></span>
					
						<span class="property-value" aria-labelledby="guestQ3-label"><g:fieldValue bean="${gameYouthCInstance}" field="guestQ3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.guestQ4}">
				<li class="fieldcontain">
					<span id="guestQ4-label" class="property-label"><g:message code="gameYouthC.guestQ4.label" default="Guest Q4" /></span>
					
						<span class="property-value" aria-labelledby="guestQ4-label"><g:fieldValue bean="${gameYouthCInstance}" field="guestQ4"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gameYouthCInstance?.guestOt}">
				<li class="fieldcontain">
					<span id="guestOt-label" class="property-label"><g:message code="gameYouthC.guestOt.label" default="Guest Ot" /></span>
					
						<span class="property-value" aria-labelledby="guestOt-label"><g:fieldValue bean="${gameYouthCInstance}" field="guestOt"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gameYouthCInstance?.id}" />
					<g:link class="edit" action="edit" id="${gameYouthCInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
