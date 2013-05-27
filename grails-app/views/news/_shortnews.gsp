<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>


<table>
	<tbody>
	<tr>
		<g:if test="${newsInstance?.imageFile?.length() > 0}">
			<td class="image">
				<g:if test="${headlineIsLink}">
					<g:if test="${newsInstance?.linkStory}">
						<g:link controller="story" action="show" id="${newsInstance?.linkStory?.id}"><img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathNewsImages + newsInstance?.imageFile}" width="130"/></g:link>
					</g:if>
					<g:else>
						<g:link controller="news" action="show" id="${newsInstance?.id}"><img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathNewsImages + newsInstance?.imageFile}" width="130"/></g:link>
					</g:else>
				</g:if>
				<g:else>
					<img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathNewsImages + newsInstance?.imageFile}" width="130"/>
				</g:else>
			</td>
		</g:if>

		<td class="text">
			<h2>
				<g:if test="${headlineIsLink}">
					<g:if test="${newsInstance?.linkStory}">
						<g:link controller="story" action="show" id="${newsInstance?.linkStory?.id}"><g:fieldValue bean="${newsInstance}" field="headline" /></g:link>
					</g:if>
					<g:else>
						<g:link controller="news" action="show" id="${newsInstance?.id}"><g:fieldValue bean="${newsInstance}" field="headline" /></g:link>
					</g:else>
				</g:if>
				<g:else>
					<g:fieldValue bean="${newsInstance}" field="headline" />
				</g:else>
			</h2>
			<h3><g:formatDate format="d.M.yyyy, HH:mm 'Uhr'" date="${newsInstance?.date}"/><span> | </span>${newsInstance?.category?.nameGerman}</h3>
			<p>
				<dd:renderParagraphs text="${newsInstance?.text}"/>
				<g:render template="newslinks" model="['newsInstance':newsInstance, 'showStoryLink':true]" />
			</p>

			<g:if test="${newsInstance?.linkStory}">
				<g:set var="linkUrl" value="${grailsApplication.config.wolverine.serverURL}/story/show/${newsInstance?.linkStory?.id}"/>
			</g:if>
			<g:else>
				<g:set var="linkUrl" value="${grailsApplication.config.wolverine.serverURL}/news/show/${newsInstance?.id}"/>
			</g:else>

			<g:render template="sociallinks" model="['linkUrl':linkUrl]" />
		</td>
	</tr>
	</tbody>
</table>

