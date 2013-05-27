package dd.project.wolverine.frontend

import dd.project.wolverine.Game
import dd.project.wolverine.GameCategory
import dd.project.wolverine.HomeStadium
import dd.project.wolverine.League
import dd.project.wolverine.System
import dd.project.wolverine.Team
import dd.project.wolverine.Util
import dd.project.wolverine.constants.Const
import dd.project.wolverine.constants.GameCategoryId
import grails.converters.JSON
import wolverine.DataService


class GameController {

    def index = { }

/*
    def schedule = {
        def scheduleArray = [
            selectSchedule(GameCategoryId.PRE_SEASON.value, params.season),
            selectSchedule(GameCategoryId.REGULAR_SEASON.value, params.season),
            selectSchedule(GameCategoryId.RELEGATION.value, params.season),
            selectSchedule(GameCategoryId.PLAYOFF.value, params.season),
            selectSchedule(GameCategoryId.BOWL.value, params.season)
        ]

        [ scheduleArray : scheduleArray ]
    }
*/

    private Game[] selectSchedule(gameCategory, season) {
	    def year

	    params.sort = "date"
	    params.order = "asc"

	    if (season == null)
		    year = ((System)servletContext.getAttribute(Const.SYSTEM))?.currentYear
	    else
	    {
		    try {
			    year = Integer.parseInt(season)
		    }
		    catch (NumberFormatException ex) {
			    // no valid number for season: get current season
			    year = ((System)servletContext.getAttribute(Const.SYSTEM))?.currentYear
		    }
	    }

        def startDate = new GregorianCalendar(year, 0, 1)
        def endDate = new GregorianCalendar(year, 11, 31)
        
        def list = Game.findAllByCategoryAndDateBetween(GameCategory.get(gameCategory), startDate.getTime(), endDate.getTime(), params)

        return list
    }


	def list = {
		[gameInstanceList:
			[
				selectSchedule(GameCategoryId.PRE_SEASON.value, params.season),
				selectSchedule(GameCategoryId.REGULAR_SEASON.value, params.season),
				selectSchedule(GameCategoryId.RELEGATION.value, params.season),
				selectSchedule(GameCategoryId.PLAYOFF.value, params.season),
				selectSchedule(GameCategoryId.BOWL.value, params.season)
			]
		];
	}


	def listJson = {
		def jsonListTotal = []
		def jsonListPre = []
		def jsonListRegular = []
		def jsonListRelegation = []
		def jsonListPlayoff = []
		def jsonListBowl = []

		def listPre = selectSchedule(GameCategoryId.PRE_SEASON.value, params.season)
		def listRegular = selectSchedule(GameCategoryId.REGULAR_SEASON.value, params.season)
		def listRelegation = selectSchedule(GameCategoryId.RELEGATION.value, params.season)
		def listPlayoff = selectSchedule(GameCategoryId.PLAYOFF.value, params.season)
		def listBowl = selectSchedule(GameCategoryId.BOWL.value, params.season)

		for (game in listPre)
			jsonListPre.add(makeJsonGame(game, false))

		for (game in listRegular)
			jsonListRegular.add(makeJsonGame(game, false))

		for (game in listRelegation)
			jsonListRelegation.add(makeJsonGame(game, false))

		for (game in listPlayoff)
			jsonListPlayoff.add(makeJsonGame(game, false))

		for (game in listBowl)
			jsonListBowl.add(makeJsonGame(game, false))

		jsonListTotal.add(jsonListPre)
		jsonListTotal.add(jsonListRegular)
		jsonListTotal.add(jsonListRelegation)
		jsonListTotal.add(jsonListPlayoff)
		jsonListTotal.add(jsonListBowl)

		render jsonListTotal as JSON;
	}


	def show(Long id, Long show) {
		def gameInstance = Game.get(id)
		if (!gameInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'system.label', default: 'Game'), id])
			redirect(controller: "news", action: "list")
			return
		}

		if ((show == -1) || (show == null))
		{
			// default showId -> find out what to show
			if (gameInstance?.report != null)
				show = Const.SHOW_REPORT;
			else if (gameInstance.getPreview() != null)
				show = Const.SHOW_PREVIEW;
//			else if ((gameInstance.getImageDir() != null) || (gameInstance.getDdPictureUrl() != null))
//				show = Const.SHOW_PHOTOS;
			else if (gameInstance.getStatsFile() != null)
				show = Const.SHOW_STATS;
			else if (gameInstance.getTeamzone() != null)
				show = Const.SHOW_TEAMZONE;
			else
				show = Const.SHOW_NOTHING;
		}

		[gameInstance: gameInstance, show: show]
	}


	def showJson = {
		def gameInstance = Game.get(params.id)
		render makeJsonGame(gameInstance, true) as JSON;
	}


	private static makeJsonGame = { Game game, Boolean generateFullStats ->
		def homeTeam = null
		def guestTeam = null
		def league = null
		def stadiumName = null;

		if (game?.homeTeamName)
			homeTeam = Team.findByName(game.homeTeamName)
		if (game?.guestTeamName)
			guestTeam = Team.findByName(game.guestTeamName)
		if (game?.leagueId)
			league = League.findById(game.leagueId)
		if (game?.homeStadiumId)
		{
			def stadium = HomeStadium.findById(game.homeStadiumId)

			if (stadium)
				stadiumName = stadium.name
		}

		if (homeTeam?.id != 1)
		{
			// Diamonds away game: find out stadium name
			stadiumName = homeTeam.stadium;
		}

		def g = new org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib()

		def jsonGameInstance = [
				id: game?.id,
				weekend: game?.weekend,
				homeTeamName: game?.homeTeamName,
				guestTeamName: game?.guestTeamName,
				homeTeamLogo: homeTeam?.logoFile,
				guestTeamLogo: guestTeam?.logoFile,
				leagueName: league?.leagueNameGerman,
				date: Util.dateToJsonString(game?.date, game?.time),
				stadium: stadiumName,
				gameUrl: g.createLink(controller: "game", action: "show", params: ["id":game?.id]),
				homeScore: game?.homeScore,
				homeQ1: game?.homeQ1,
				homeQ2: game?.homeQ2,
				homeQ3: game?.homeQ3,
				homeQ4: game?.homeQ4,
				homeOt: game?.homeOt,
				guestScore: game?.guestScore,
				guestQ1: game?.guestQ1,
				guestQ2: game?.guestQ2,
				guestQ3: game?.guestQ3,
				guestQ4: game?.guestQ4,
				guestOt: game?.guestOt
		]

		if (generateFullStats)
		{
			jsonGameInstance.statsFile = game?.statsFile
			jsonGameInstance.statsFileHtml = game?.statsFileHtml
			jsonGameInstance.preview = game?.preview
			jsonGameInstance.report = game?.report

			// TODO: Photos
		}

		return jsonGameInstance;
	}


	def checkScores = {
		params.sort = "date"
		params.order = "asc"

		def categoryList = [GameCategory.get(1), GameCategory.get(3), GameCategory.get(4), GameCategory.get(5)];
		def gameInstanceList = Game.findAllByCategoryInList(categoryList, params)

		[gameInstanceList: gameInstanceList]
	}

}
