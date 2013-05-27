
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
				    <h2>Das Herrenteam der Darmstadt Diamonds</h2>
				    <g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-team.jpg" width="587" height="235"/>
			    </div>

			    <div class="text">
				    <p>Die Diamonds wurden im September 1985 gegründet und waren damit eines der ersten American Football Teams in Hessen. Als Vereinsfarben wurden royalblau, silber und weiss gewählt, in Anlehnung an die Wappen-Farben blau und silber der Stadt Darmstadt.</p>
				    <p>Spielerisch profitierten die Diamonds anfangs von den in der Gegend stationierten amerikanischen Soldaten, so dass der junge Verein schon früh von gut ausgebildeten Trainern profitierte und rasch von Liga zu Liga aufsteigen konnte.
				      Gekrönt wurde die Vereinsarbeit vom ersten Aufstieg in die damalige erste Bundesliga 1989. Von 1990 bis 1992 sowie von 2006 bis 2008 spielten die Südhessen in der höchsten Deutschen Liga, die sich heute German Football League nennt.</p>

				    <p>Die größten sportlichen Erfolge waren 1990 und 2007 der Einzug in die Playoffs um den German Bowl, die Finalrunde um die Deutsche Meisterschaft. Von 2000 bis 2005 spielten die Diamonds in der 2.&nbsp;Bundesliga Süd.</p>

				    <p>2012 musste unser Team mit Verletzungspech und vielen knappen Niederlagen den Weg in die Regional-Liga Mitte antreten. Daher ist das erklärte Ziel für 2013 der sofortige Wiederaufstieg.</p>
				    <p>Von 1985 bis 2002 waren die Diamonds ein eigenständiger Verein. Von 2003 bis 2004 waren sie dann eine Abteilung des SV Blau-Gelb Darmstadt, bevor sich die Diamanten am 1. Januar 2005 der TSG 1846 Darmstadt anschlossen.</p>

				    <g:render template="practices" model="[practiceInstanceList:practiceInstanceList, category: 1]"/>
			    </div>

			    <div class="article-footer">&nbsp;</div>
			    Kontakt: <a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#105;&#110;&#102;&#111;&#64;&#100;&#97;&#114;&#109;&#115;&#116;&#97;&#100;&#116;&#45;&#100;&#105;&#97;&#109;&#111;&#110;&#100;&#115;&#46;&#100;&#101;">info(at)darmstadt-diamonds.de</a>
		    </div>
		</div>
    </body>
</html>
