
<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="newsLayout" />
</head>


<body>
	<div class="left-side">
		<div class="news-list-index" style="margin-top:10px">
			<div class="news-item" style="border-bottom:0px; padding: 0 0 0 0 ;margin: 0 0 20px 0;">
				<g:if test="${newsInstance?.imageHeaderFile}">
					<!-- Article with header image -->
					<table>
						<tbody>
						<tr>
							<td class="text">
								<h2>
									<g:fieldValue bean="${newsInstance}" field="headline" />
								</h2>
								<g:if test="${newsInstance?.date}">
									<h3><g:formatDate format="d.M.yyyy, HH:mm 'Uhr'" date="${newsInstance?.date}"/><span> | </span>${newsInstance?.category?.nameGerman}</h3>
								</g:if>
							</td>
						</tr>
						</tbody>
					</table>

					<img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathNewsHeaderImages + newsInstance?.imageHeaderFile}" />

					<table>
						<tbody>
						<tr>
							<td class="text">
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
				</g:if>
				<g:else>
					<!-- Article without header image -->
					<g:render template="shortnews" model="['newsInstance':newsInstance, 'headlineIsLink':false]" />
				</g:else>
			</div>
		</div>
	</div>
</body>
</html>
