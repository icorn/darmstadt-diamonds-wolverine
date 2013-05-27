
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
				    <h2>Das Darmstadt Diamonds Danceteam</h2>
					<g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-danceteam-info.jpg" width="587" height="235"/>
			    </div>

			    <div class="text">
					<p>
						Das Darmstadt Diamonds Danceteam sorgt bei den Heimspielen der Darmstadt Diamonds für großes Aufsehen. Mit Attraktivität, Ausstrahlung und Choreographien auf Spitzenniveau
						verzaubert unser Danceteam jedes Publikum und verbreitet eine positive Atmosphäre. Wer sie schon einmal live erleben durfte, der weiss, dass es sich alleine wegen ihnen lohnt,
						ein Spiel der Darmstadt Diamonds zu besuchen.
					</p>
				    <p>
					    Gegründet wurde unser Danceteam Anfang 2004 von Anna-Lucia Campanelli als Teil der Darmstadt Diamonds. Anfangs noch eine Abteilung des SV Blau-Gelb Darmstadt wechselten die
					    Darmstadt Diamonds samt Danceteam Anfang 2005 zur TSG 1846 Darmstadt. Im Herbst 2006  übernahm Nicole Schließauf, welche selber seit Gründung des Teams Mitglied ist, die Trainerrolle.
					    Ende 2010 übergab Nicole Schliessauf das Danceteam an Giuseppina Tartarelli, die es sich zur Aufgabe machte neue Choreographie zu entwickeln und an Larissa Laumann, die sich mit dem organisatiorischen Teil des Danceteams befasst.
				    </p>
				    <p>
					    In erster Linie konzentriert sich das Diamonds Danceteam darauf, die Darmstadt Diamonds bei allen Heim- und Auswärtsspielen mit Tanz und Stimmgewalt zu unterstützen.
					    Aber auch für andere Auftritte, z.&nbsp;B. bei Firmenfeiern, Eröffnungen oder Ähnlichem kann das Danceteam gebucht werden.
					    In den vergangenen Jahren erfreute sich das Danceteam der Diamonds wachsender Beliebtheit – so besteht das Danceteam derzeit aus 13 tanzbegeisterten Mädchen.
				    </p>

				    <g:render template="practices" model="[practiceInstanceList:practiceInstanceList, category: 5]"/>
			    </div>

			    <div class="article-footer">&nbsp;</div>
			    Kontakt: <a href="&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#100;&#97;&#110;&#99;&#101;&#116;&#101;&#97;&#109;&#64;&#100;&#97;&#114;&#109;&#115;&#116;&#97;&#100;&#116;&#45;&#100;&#105;&#97;&#109;&#111;&#110;&#100;&#115;&#46;&#100;&#101;">danceteam(at)darmstadt-diamonds.de</a>
		    </div>
		</div>
    </body>
</html>
