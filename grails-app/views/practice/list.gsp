
<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="newsLayout" />
</head>

<body>
<div class="left-side">
	<div class="article-wrapper" style="margin-top:8px;">
		<div class="section-header">
			<h2>Trainingstermine</h2>
			<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-practice.jpg" width="587" height="235"/>
		</div>

		<div class="text">
			<p>
				Hier alle Trainings-Termine unserer verschiedenen Teams:
			</p>

			<g:if test="${practiceInstanceList?.size() > 0}">
				<g:set var="oldCategory" value=""/>

				<g:each in="${practiceInstanceList}" var="practice">
					<g:if test="${oldCategory != practice?.category}">
						<div style="font-weight: bold; padding-top: 5px;">${practice?.category?.nameGerman}</div>
					</g:if>

					<li>
						${practice?.completeDate}

						<g:if test="${practice?.facility}">
							<!-- TODO -->
							${practice?.facilityName}
						</g:if>
						<g:else>
							${practice?.facilityName}
						</g:else>
					</li>

					<g:set var="oldCategory" value="${practice?.category}"/>
				</g:each>
			</g:if>
			<g:else>
				Derzeit findet kein Training statt.
			</g:else>
		</div>
	</div>
</div>
</body>
</html>
