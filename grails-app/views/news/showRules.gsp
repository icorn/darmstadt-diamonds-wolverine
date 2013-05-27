
<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="columnLayout" />
</head>

<body>
	<div class="full-width-header">
		<h2>Football-Regeln</h2>
	</div>

	<div class="portfolio-wrapper portfolio-single">
		<ul>
			<li class="image"><g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-regelnb.jpg" width="435" height="250"/></li>
			<li class="text">
				<h2>Grundregeln</h2>
				<p>
					Das eigentliche Ziel im American Football ist es, Punkte zu machen, indem man das Spielfeld überbrückt und in die Endzone des Gegners eindringt. Dabei kann man Punkte in unterschiedlicher Weise erzielen, die verschieden gewertet werden.
				</p>
				<p>
					Um das Spielfeld zu überqueren hat die Angriffsformation einer Mannschaft (Offense, bestehend aus 11 Spielern) vier Versuche, um 10 Yards (1 Yard = 91,44 cm) oder mehr in Richtung gegnerische Endzone zu überbrücken.
					Dies geschieht, indem mit dem Ball gelaufen wird oder der Ball geworfen und gefangen wird. Ist es gelungen, die 10 Yards zu überbrücken, hat die Mannschaft vier weitere Versuche (First Down) für die nächsten 10 Yards.
					Gelingt es nicht, mit vier Versuchen 10 Yards zu gewinnen, wechselt das Angriffsrecht und damit der Ball zum gegnerischen Team; die Rollen des Angriffs und der Verteidigung werden gewechselt.
				</p>
				<p>
					Den Spielern der Offense stehen 11 Verteidiger, Defense genannt, gegenüber. Sie versuchen den Angriff zu stoppen, um die eigene Mannschaft in Ballbesitz zu bringen.
				</p>
			</li>
			<li class="spacer">&nbsp;</li>

			<li class="image"><g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-regelnc.jpg" width="435" height="250"/></li>
			<li class="text">
				<h2><a href="http://www.orange-themes.com/oxygen/portfolio/aliquam-consectetur-suscipit-tincidunt-pulvinar/">Die Regeln im Detail</a></h2>
				<p>
					So weit ist es eigentlich ganz einfach. Wenn Sie mehr in die Tiefe gehen wollen, empfehlen wir Ihnen unser einfach verständliches Regelbuch unter dem unten stehenden Link runter zu laden. Es hat alle Details für Anfänger sowie viele
					interessante Informationen über Spielzüge und Taktiken, dazu noch die Unterschiede zum Football der NFL, wie Sie ihn aus dem Fernsehen kennen, da wir in Deutschland nach den Regeln für den College-Football spielen.
					Zusätzlich finden Sie in unserem Regelbuch auch die Unterschiede zwischen den Ligen in Deutschland und den College-Regeln.
				</p>
				<p>
					Link: <a href="${((System)application.getAttribute(Const.SYSTEM))?.absPathPdfFiles + 'regelbuch.pdf'}" target="_blank">Football-Regelbuch</a>
				</p>
			</li>
			<li class="spacer">&nbsp;</li>

			<li class="image"><g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-regelna.jpg" width="435" height="250"/></li>
			<li class="text">
				<h2><a href="http://www.orange-themes.com/oxygen/portfolio/curabitur-ultricies-sagittis-lorem/">Wichtige Schiedsrichter-Signale</a></h2>
				<p>
					Beim American Football gibt es viele Situationen, in denen der Haupt-Schiedsrichter (zu erkennen an der weißen Mütze) signalisiert, was geschehen ist oder welchen Regelverstoß er gesehen hat.
					Die wichtigsten und häufigsten Schiedsrichter-Signale haben wir für Sie zusammengestellt.
				</p>
				<p>
					Link: <a href="${((System)application.getAttribute(Const.SYSTEM))?.absPathPdfFiles + 'signale.pdf'}" target="_blank">Schiedsrichter-Signale</a>
				</p>
			</li>
		</ul>
	</div>

	<div class="pages">
	</div>
</body>
</html>
