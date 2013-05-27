
<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="newsLayout" />
</head>

<body>
	<g:set var="newsImageFile"/>

	<g:if test="${storyInstance?.news?.imageHeaderFile?.length() > 0}">
		<g:set var="newsImageFile" value="${((System)application.getAttribute(Const.SYSTEM))?.absPathNewsHeaderImages + storyInstance?.news?.imageHeaderFile}"/>
	</g:if>
	<g:elseif test="${storyInstance?.newsImageFile?.length() > 0}">
		<g:set var="newsImageFile" value="${((System)application.getAttribute(Const.SYSTEM))?.absPathNewsImages + storyInstance?.newsImageFile}"/>
	</g:elseif>

	<div class="left-side">
		<div class="news-list-index" style="margin-top:10px">
			<div class="news-item" style="border-bottom:0px; padding: 0 0 0 0 ;margin: 0 0 20px 0;">
				<table>
					<tbody>
					<tr>
						<td class="text">
							<h2>
								<g:fieldValue bean="${storyInstance}" field="headline" />
							</h2>

							<g:if test="${storyInstance?.news}">
								<h3><g:formatDate format="d.M.yyyy, HH:mm 'Uhr'" date="${storyInstance?.news?.date}"/><span> | </span>${storyInstance?.news?.category?.nameGerman}</h3>
							</g:if>
							<g:else>
								<h3><g:formatDate format="d.M.yyyy" date="${storyInstance?.date}"/><span></h3>
							</g:else>
						</td>
					</tr>
					</tbody>
				</table>

				<g:if test="${newsImageFile?.length() > 0}">
					<img src="${newsImageFile}" />
				</g:if>

				<table>
					<tbody>
					<tr>
						<td class="text">
							<p>
								<dd:renderParagraphs text="${storyInstance?.text}"/>

								<g:if test="${storyInstance?.otherImageFile?.length() > 0}">
									<br/>
									<img src="${storyInstance?.otherImageFile}" />
								</g:if>

								<g:render template="/news/newslinks" model="['newsInstance':storyInstance?.news, 'showStoryLink':false]" />
							</p>

							<g:set var="linkUrl" value="${grailsApplication.config.wolverine.serverURL}/story/show/${storyInstance?.id}"/>
							<g:render template="/news/sociallinks" model="['linkUrl':linkUrl]" />
						</td>
					</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>
