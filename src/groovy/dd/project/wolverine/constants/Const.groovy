package dd.project.wolverine.constants

import org.codehaus.groovy.grails.web.mapping.LinkGenerator

/**
 * Created with IntelliJ IDEA.
 * User: oli
 * Date: 02.03.13
 * Time: 15:03
 * To change this template use File | Settings | File Templates.
 */
class Const
{
	static final SYSTEM = "System"
	static final RANDOM = "Random"

	static final DIAMONDS_TEAM_ID = 1
	static final COACH_CATEGORY_FIRST_TEAM = 1

	static final INFO_BANNER_IMAGE_LIST = ["danceteam.jpg", "foerderverein.jpg", /*"helfer-gesucht.jpg",*/ "jugend.jpg", "regelbuch.jpg", "spieler-gesucht.jpg" /*, "twitter_facebook.jpg"*/ ]

	static final SHOW_NOTHING	= 0
	static final SHOW_PREVIEW	= 1
	static final SHOW_REPORT	= 2
	static final SHOW_STATS		= 3
	static final SHOW_PHOTOS	= 4
	static final SHOW_TEAMZONE	= 5

	static final GAME_CATEGORY_REGULAR_SEASON   = 1
	static final GAME_CATEGORY_PRE_SEASON       = 2
	static final GAME_CATEGORY_PLAYOFFS         = 3
	static final GAME_CATEGORY_RELEGATION       = 4
	static final GAME_CATEGORY_BOWL             = 5
}
