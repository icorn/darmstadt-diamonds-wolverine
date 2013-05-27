
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
				    <h2>Der Diamonds-Fanshop</h2>
				    <g:img uri="${((System)application.getAttribute(Const.SYSTEM))?.absPathMenuBannerImages}menubanner-fanshop.jpg"/>
			    </div>

			    <div class="text">
					<p>
						Bisher war für unsere Fans ein Besuch bei einem der Diamonds-Heimspiele die einzige Möglichkeit, Kleidung, Mützen und Ähnliches zu kaufen.
						Seit diesem Jahr können Sie auch bei unserem neuen Partner 2k5 Athletics auch online Artikel mit dem Diamonds-Logo bestellen.
					</p>
				    <p>
						Der Verkauf am Gameday wird natürlich weiterhin möglich sein.
				    </p>
				    <p>
						Unter dem folgenden Link kommen Sie direkt zu unserem Online-Fanshop. Viel Spaß beim Bestellen!
				    </p>
				    <p>
					    <div class="block-1" style="margin-bottom: 0px;">
						    <g:link url="http://dd.2-K-5.de" target="_blank"><img src="${((System)application.getAttribute(Const.SYSTEM))?.absPathInfoBanner + 'fanshop.jpg'}" class="right-banner-image-shadow"/></g:link>
					    </div>
				    </p>
			    </div>
		    </div>
		</div>
    </body>
</html>
