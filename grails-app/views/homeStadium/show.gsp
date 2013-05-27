
<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="newsLayout" />
</head>

<body>
	<div class="left-side">

		<div class="article-wrapper">
			<div class="section-header">
				<h2>${homeStadiumInstance?.name}</h2>
				<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathStadiumsImages + homeStadiumInstance?.imageStadium}" width="587" height="235"/>
			</div>

			<div class="text">
				<g:if test="${homeStadiumInstance?.address}">
					<div style="font-size: 14px"><b>Anschrift:</b></div>
					<p>
						${homeStadiumInstance?.address}
					</p>
				</g:if>

				<g:if test="${homeStadiumInstance?.capacity}">
					<div style="font-size: 14px"><b>Kapazität:</b></div>
					<p>
						${homeStadiumInstance?.capacity}
					</p>
				</g:if>

				<g:if test="${homeStadiumInstance?.publicTransport}">
					<div style="font-size: 14px"><b>Anreise mit öffentlichen Verkehrsmitteln:</b></div>
					<p>
						${homeStadiumInstance?.publicTransport}
					</p>
				</g:if>

				<g:if test="${homeStadiumInstance?.gmapsEmbed}">
					<div style="font-size: 14px"><b>Stadtplan:</b></div>
					<p>
						${homeStadiumInstance?.gmapsEmbed}
					</p>
				</g:if>

				<g:if test="${homeStadiumInstance?.comment}">
					<div style="font-size: 14px"><b>Hinweis:</b></div>
					<p>
						${homeStadiumInstance?.comment}
					</p>
				</g:if>

			<%--
							<g:if test="${homeStadiumInstance?.directions || homeStadiumInstance?.imageDirections}">
								<div style="font-size: 14px"><b>Anfahrt:</b></div>

								<g:if test="${homeStadiumInstance?.directions}">
									<p>
										${homeStadiumInstance?.directions}
									</p>
								</g:if>

								<g:if test="${homeStadiumInstance?.imageDirections}">
									<p>
										<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathStadiumsImages + homeStadiumInstance?.imageDirections}"/>
									</p>
								</g:if>
							</g:if>
			--%>
			</div>
		</div>
	</div>
</body>
</html>
