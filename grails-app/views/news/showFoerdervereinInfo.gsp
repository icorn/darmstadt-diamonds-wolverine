
<%@ page import="dd.project.wolverine.constants.Const; dd.project.wolverine.System" %>

<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="newsLayout" />
    </head>

    <body>

	    <div class="left-side">

		    <div class="article-wrapper">
			    <div class="section-header">
				    <h2>Förderverein</h2>
				    <g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-foerderverein.jpg" width="587" height="235"/>
			    </div>

			    <div class="text">
				    <p>
			            Wer die Darmstadt Diamonds direkt unterstützen möchte, kann dem gemeinnützigen "Förderverein Darmstadt Diamonds e. V." beitreten. Alle Details stehen in der Satzung, die unten heruntergeladen werden kann.
				    </p>
				    <p>
			            Lange Zeit gab es für unsere Fans, ehemaligen Spieler und Eltern von Jugendspielern keine Möglichkeit einer passiven Mitgliedschaft, um unserer Jugend-Sparte finanziell zu helfen. 2012 haben wir daher den
			            Förderverein ins Leben gerufen, der seit dem tatkräftig die Diamonds bei ihrer Jugendarbeit unterstützt. Mt gerade einmal 20 Euro pro Kalenderjahr wird man Mitglied und Förderer der Darmstadt Diamonds Jugendmannschaften.
			            Und wer mehr als nur 20 Euro geben möchte, der kann den Beitrag auch gerne erhöhen. Über den Mehrbetrag gibt es natürlich eine abzugsfähige Spendenquittung.
				    </p>
				    <p>
			            Am Spieltag können Sie einen Antrag auf Mitgliedschaft ausfüllen, den Sie in unseren Gameday-Magazinen finden können. Sie können den ausgedruckten und unterschriebenen Aufnahmeantrag aber auch direkt per Post an die
			            Geschäftsstelle schicken:
				    </p>
				    <p>
					    <b>
						    Förderverein Darmstadt Diamonds e. V.<br/>
						    c/o Peter Koch<br/>
						    Robert-Bosch Straße 12<br/>
						    64293 Darmstadt
						</b>
				    </p>

				    Vorstand:
				    <ul>
					    <li>1. Vorsitzender Marc Fauquemberque</li>
			            <li>2. Vorsitzender Peter Koch</li>
			            <li>Kassenwart Andreas Baumann</li>
			            <li>Schriftführer Christian Althoff</li>
				    </ul>

				    Link: <a href="${((System)application.getAttribute(Const.SYSTEM))?.absPathPdfFiles + 'foerderverein.pdf'}" target="_blank">Aufnahmeantrag und Satzung</a>.
			    </div>
		    </div>
		</div>
    </body>
</html>
