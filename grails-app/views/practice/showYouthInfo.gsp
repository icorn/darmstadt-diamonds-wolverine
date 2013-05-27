
<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="columnLayout" />
</head>

<body>
	<div class="full-width-header">
		<h2>Die Jugendteams der Darmstadt Diamonds</h2>
	</div>

	<div class="portfolio-wrapper portfolio-three">
		<ul>
			<li class="image">
				<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-a-jugend.jpg" width="280" height="180"/>
				<h2>A-Jugend</h2>
				<p>
					Die A-Jugend (16 bis 19 Jahre) der Darmstadt Diamonds kann auf eine lange und erfolgreiche Geschichte zurückblicken. Sechs mal in Folge Hessenmeister, sechs weitere male erreichte unser Nachwuchs die Deutsche Vizemeisterschaft,
					und 1995 sowie 2001 holte man sogar den Titel. Die Mannschaft tritt in der GFL Juniors an, der höchsten deutschen Spielklasse im Jugendbereich, deren Spielbetrieb i.&nbsp;d.&nbsp;R. von April bis Juni läuft. Das Ziel der A-Jugend ist es,
					sich langfristig als Playoffkandidat zu etablieren und den Nachwuchs optimal zu fördern. Der Trainingsbetrieb läuft (fast) das ganze Jahr.
				</p>
				<g:render template="practices" model="[practiceInstanceList:practiceInstanceList, category: 2]"/>
			</li>

			<li class="image">
				<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-b-jugend.jpg" width="280" height="180"/>
				<h2>B-Jugend</h2>
				<p>
					Die B-Jugend für Jugendliche von 13 bis 16 Jahren soll einerseits die jüngeren Spieler der A-Jugend zusätzlich fördern, und andererseits sollen 14jährige Flagfootballer sowie Spieler aus der C-Jugend mit diesem Übergang an die A-Jugend
					heran geführt werden. Außerdem können so auch Neulinge erstmals die Möglichkeit bekommen, Tackle-Football kennenzulernen. Die B-Jugend ist somit ideal, um in den Sport einmal rein zu schnuppern. In der B-Jugend wird im Herbst gespielt.
				</p>
				<g:render template="practices" model="[practiceInstanceList:practiceInstanceList, category: 6]"/>
			</li>

			<li class="image">
				<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-c-jugend.jpg" width="280" height="180"/>
				<h2>C-Jugend</h2>
				<p>
					Seit 2011 haben wir unsere jüngste Tacklefootball-Mannschaft: Die Darmstadt Diamonds C-Jugend für Kinder von 13 bis 15 Jahren. Die Saison verläuft parallel zur A-Jugend-Saison vom Frühjahr bis zu den Sommerferien. Das Ziel ist es,
					so früh wie möglich Nachwuchs für unsere älteren Jugendteams auszubilden. Außerdem können so auch die ganz jungen Kids an den Sport herangeführt werden. Der Trainingsbetrieb findet fast das ganze Jahr statt.
				</p>
				<g:render template="practices" model="[practiceInstanceList:practiceInstanceList, category: 7]"/>
			</li>

			<li class="spacer">&nbsp;</li>

			<li class="image">
				<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-flag-jugend.jpg" width="280" height="180"/>
				<h2>Flag-Jugend</h2>
				<p>
					Unsere D-Jugendmannschaft für Flagfootball für Kinder zwischen 9 und 12 Jahren trainiert regelmäßig zwei Mal pro Woche. Mit Flagfootball wird die entschärfte Form des American Football bezeichnet, die auch Kindern und interessierten
					Erwachsenen die Möglichkeit gibt, diese faszinierende Sportart auszuüben. Die wesentlichen Unterschiede zum Tackle-Football sind, dass Anstatt einer Schutzausrüstung die Spieler einen Gürtel mit 2 sog. "Flags" tragen.
					Der Ballträger wird somit nicht zu Boden gebracht, sondern durch ziehen der Flags gestoppt. Außerdem stehen nur 5 bis 9 Spieler pro Team gleichzeitig auf dem Feld, und der Körperkontakt ist nicht erlaubt, außer Blocken mit offener Hand
					und mit angewinkeltem Arm von vorne gegen den Oberkörper.
				</p>
				<g:render template="practices" model="[practiceInstanceList:practiceInstanceList, category: 4]"/>
			</li>

			<li class="image">
				<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-flag-schule.jpg" width="280" height="180"/>
				<h2>Flagfootball-Schulprojekte</h2>
				<p>
					Immer wieder führen wir an Schulen im Darmstadt und Umgebung Projekt-Wochen durch, und bringen Schülern und Lehrern Football in der Form von Flagfootball näher. Dabei zeigen wir den Schülern die typische Ausrüstung und Helme,
					zeigen die Bälle und erklären die Taktik und Regeln auf eine verständliche und einfache Weise. Anschließend wird ein Flagfootball-Spiel durchgeführt, und die Schüler können (wenn es mit der Saison zusammen passt) kostenlos ein Spiel
					der Darmstadt Diamonds live im Stadion miterleben.
				</p>
				<p>
					Falls wir auch an Eurer Schule eine Woche American Football präsentieren sollen, könnt Ihr uns gerne kontaktieren.
				</p>
			</li>

			<li class="spacer">&nbsp;</li>
		</ul>
	</div>

	Kontakt: <a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#106;&#117;&#103;&#101;&#110;&#100;&#64;&#100;&#97;&#114;&#109;&#115;&#116;&#97;&#100;&#116;&#45;&#100;&#105;&#97;&#109;&#111;&#110;&#100;&#115;&#46;&#100;&#101;">jugend(at)darmstadt-diamonds.de</a>
</body>
</html>
