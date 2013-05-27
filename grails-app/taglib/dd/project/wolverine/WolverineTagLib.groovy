package dd.project.wolverine

import dd.project.wolverine.constants.Const
import org.codehaus.groovy.grails.web.mapping.LinkGenerator

import javax.servlet.ServletContext
import java.util.GregorianCalendar
import java.util.Calendar


class WolverineTagLib {
    
    static namespace = 'dd'
	LinkGenerator grailsLinkGenerator


    /**
     * Renders a big text into multiple paragraphs.
     * Two consecutive linefeeds are converted into a change of paragraphs.
     *
     * @param text  the complete text of all paragraphs
     */
    def renderParagraphs = { attrs, body ->
        def textArray = []

        if (attrs?.text)
            textArray = attrs?.text.split("\r\n\r\n")

        textArray.eachWithIndex { text, i ->
            if (i == 0)
                out << "<p>" + text + "</p>"
            else
                out << '<p style="margin-top:8px;">' + text + '</p>'
        }
    }


    /**
     * Renders a big text into multiple paragraphs.
     * Two consecutive linefeeds are converted into a change of paragraphs.
     *
     * @param text  the complete text of all paragraphs
     */
    def formatGameDate = { attrs, body ->
        if (attrs?.game) {
            def dateString = "";
		
            GregorianCalendar cal = new GregorianCalendar();
            cal.setTime(attrs?.game.date);
            dateString = cal.get(Calendar.DAY_OF_MONTH) + "." + (cal.get(Calendar.MONTH)+1) + ".";

            if (attrs?.game.weekend)
            {
                // weekend is true: add the second day to the datestring
                cal.add(java.util.Calendar.DAY_OF_MONTH, 1);
                dateString += "/" + cal.get(Calendar.DAY_OF_MONTH) + "." + (cal.get(Calendar.MONTH)+1) + ".";
            }
            else
            {
                // no weekend-flag: add day (Sunday or Saturday)
                if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY)
                    dateString += "&nbsp;(Sa.)";
                else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY)
                    dateString += "&nbsp;(So.)";
                else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.TUESDAY)
                    dateString += "&nbsp;(Di.)";
                else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.WEDNESDAY)
                    dateString += "&nbsp;(Mi.)";
                else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.THURSDAY)
                    dateString += "&nbsp;(Do.)";
            }
            
            out << dateString
        }
    }


    /**
     * Renders the text of a news item suitable for the header.
     *
     * @param text  the complete text of the news item
     */
    def renderHeaderText = { attrs, body ->
	    def maxLength = 170;
	    def retval = "";

        if (attrs?.text)
        {
	        retval = (String)attrs?.text

	        if (retval.length() > maxLength)
	        {
		        def cutOff = retval.indexOf(" ", maxLength)

		        if (cutOff > 0)
		            retval = retval.substring(0, cutOff) + "..."
	        }
        }

		out << retval
    }


	def showRandomLinkBanner = { attrs, body ->
		def randomBannerLinks = []

		// generate a list with links for the random-banners
		randomBannerLinks.add(grailsLinkGenerator.link(controller: 'practice', action: 'showDanceteamInfo')) // danceteam.jpg
		randomBannerLinks.add(grailsLinkGenerator.link(controller: 'news', action: 'showFoerdervereinInfo')) // foerderverein.jpg
//	    randomBannerLinks.add(grailsLinkGenerator.link(controller: 'practice', action: 'showDanceteamInfo')) // helfer-gesucht.jpg
		randomBannerLinks.add(grailsLinkGenerator.link(controller: 'practice', action: 'showYouthInfo'))     // jugend.jpg
		randomBannerLinks.add(grailsLinkGenerator.link(controller: 'news', action: 'showRules'))             // regelbuch.jpg
		randomBannerLinks.add(grailsLinkGenerator.link(controller: 'practice', action: 'showFirstInfo'))     // spieler-gesucht.jpg
//	    randomBannerLinks.add(grailsLinkGenerator.link(controller: 'practice', action: 'showDanceteamInfo')) // twitter_facebook.jpg

		def random = ((Random)servletContext.getAttribute(Const.RANDOM)).nextInt(randomBannerLinks.size());

		out << '<a href="' + randomBannerLinks?.get(random) + '">' +
				'<img src="' + ((System)servletContext?.getAttribute(Const.SYSTEM))?.absPathInfoBanner + Const.INFO_BANNER_IMAGE_LIST?.get(random) +
				'" width="250" height="100" class="right-banner-image-shadow"/>' +
				'</a>'
	}

}
