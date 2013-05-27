
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
			<h2>Spenden</h2>
			<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages + 'menubanner-donations.jpg'}" width="587" height="235"/>
		</div>

		<div class="text">
			<p>American Football ist ein toller, aber auch teurer Sport. Deshalb sind wir für jede Spende dankbar, egal in welcher Höhe. Sie erhalten selbstverständlich eine Spendenquittung, denn so ist ihre Spende steuerlich abzugsfähig.</p>
			<p><b>Und so funktioniert es:</b></p>
			<p>Überweisen Sie den gewünschten Betrag auf unser Spendenkonto:</p>
			<p>
				Name: TSG 1846 Darmstadt<br/>
				Konto-Nr.: 16002178<br/>
				BLZ: 50850150<br/>
				Stadt- und Kreissparkasse Darmstadt
			</p>

			<p>
				<b>Wichtig:</b><br>
				Als Verwendungszweck bitte „Diamonds” angeben, zusammen mit Ihrer Anschrift. Innerhalb weniger Tage geht Ihnen dann die Spendenquittung per Post zu.
			</p>
		</div>
	</div>
</div>
</body>
</html>
