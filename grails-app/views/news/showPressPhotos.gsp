
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
			<h2>Presse-Fotos und Logos</h2>
		</div>

		<div class="text">
			<br/>
			<div style="font-size: 14px;"><b>Fotos:</b>
				<ul>
					<li><g:link url="${((System)application.getAttribute(Const.SYSTEM))?.absPathPressImages + 'danceteam.jpg'}" target="_blank">Danceteam (420 KB)</g:link></li>
					<li><g:link url="${((System)application.getAttribute(Const.SYSTEM))?.absPathPressImages + 'defense.jpg'}"   target="_blank">Defense (9,1 MB)</g:link></li>
					<li><g:link url="${((System)application.getAttribute(Const.SYSTEM))?.absPathPressImages + 'jugend.jpg'}"    target="_blank">Jugend (1,8 MB)</g:link></li>
					<li><g:link url="${((System)application.getAttribute(Const.SYSTEM))?.absPathPressImages + 'lineman.jpg'}"   target="_blank">Linienspieler (8,1 MB)</g:link></li>
					<li><g:link url="${((System)application.getAttribute(Const.SYSTEM))?.absPathPressImages + 'offense.jpg'}"   target="_blank">Offense (8,4 MB)</g:link></li>
				</ul>
			</div>

			<div style="font-size: 14px;"><b>Logos:</b>
				<ul>
					<li><g:link url="${((System)application.getAttribute(Const.SYSTEM))?.absPathPressImages + 'logo_diamant.gif'}"     target="_blank">Diamonds-Logo (GIF, 143 KB)</g:link></li>
					<li><g:link url="${((System)application.getAttribute(Const.SYSTEM))?.absPathPressImages + 'logo_diamant_cmyk.ai'}" target="_blank">Diamonds-Logo (Illustrator-Format, CMYK, 1,1 MB)</g:link></li>
				</ul>
			</div>
		</div>

		Das Logo ist urheberrechtlich geschützt. Es ist einzig für Pressearbeit freigegeben. Jegliche kommerzielle oder anderweitige Nutzung als für Berichterstattung ist ausdrücklich untersagt, und bedarf der vorherigen schriftlichen Zustimmung der Darmstadt Diamonds.<br/><br/>
		Die Fotos auf dieser Seite sind für Pressearbeit freigegeben. Copyright Sebastian Pöthig, www.sepics.de, soweit nicht anders vermerkt. Der Fotograf sowie die Webseite www.sepics.de ist zwingend als Quelle zu nennen.
	</div>
</div>
</body>
</html>
