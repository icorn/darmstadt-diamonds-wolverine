
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
			<h2>Diamonds-Tickets</h2>
			<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages + 'menubanner-tickets.jpg'}" width="587" height="235"/>
		</div>

		<div class="text">
			<div style="font-size: 14px"><b>Tageskarten</b></div>
			<ul>
				<li>Die Tageskarte kostet 5 EUR</li>
			</ul>

			<div style="font-size: 14px"><b>Familienkarten</b></div>
			<ul>
				<li>Die Familienkarte kostet 10 EUR und ist gültig für ein Heimspiel. Mit der Familienkarte können bis zu 2 Erwachsene zusammen mit bis zu 3 Kindern (0 bis 15 Jahre) das Spiel besuchen.</li>
			</ul>

			<div style="font-size: 14px"><b>Freier Zutritt</b></div>
			<ul>
				<li>Kostenlosen Zutritt haben Mitglieder der Darmstadt Diamonds, Kinder unter 10 Jahren und Inhaber der Ehrenamts-Card (jeweils gegen Nachweis).</li>
				<li>Presse und Medien melden sich bitte vor dem Spiel für Akkreditierungen per E-Mail an:
					<a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#105;&#110;&#102;&#111;&#64;&#100;&#97;&#114;&#109;&#115;&#116;&#97;&#100;&#116;&#45;&#100;&#105;&#97;&#109;&#111;&#110;&#100;&#115;&#46;&#100;&#101;">info(at)darmstadt-diamonds.de</a></li>
			</ul>

		</div>
	</div>
</div>
</body>
</html>
