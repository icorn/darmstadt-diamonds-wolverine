package dd.project.wolverine.frontend;

import dd.project.wolverine.LeagueTable;
import dd.project.wolverine.System
import dd.project.wolverine.Team
import dd.project.wolverine.Util
import dd.project.wolverine.constants.Const
import grails.converters.JSON;

class LeagueTableController {

    def index = { }

    def list = {
        params.sort = "position"
        params.order = "asc"

	    [leagueTableInstanceList: LeagueTable.findAllBySeason(((System)servletContext.getAttribute(Const.SYSTEM))?.currentYear?.intValue(), params)]
    }

	def listJson = {
		params.sort = "position"
		params.order = "asc"

		def leagueTableInstanceList = LeagueTable.findAllBySeason(((System)servletContext.getAttribute(Const.SYSTEM))?.currentYear?.intValue(), params)
		def jsonList = [];

		for (leagueTableInstance in leagueTableInstanceList)
		{
			def team = Team.findByName(leagueTableInstance.teamName);
			def jsonLeagueTableInstance = [
				id:         leagueTableInstance.id,
				position:   leagueTableInstance.position,
				stamp:      Util.dateToJsonString(leagueTableInstance.stamp),
				wins:       leagueTableInstance.wins,
				ties:       leagueTableInstance.ties,
				losses:     leagueTableInstance.losses,
				pointsMade: leagueTableInstance.pointsMade,
				pointsOpp:  leagueTableInstance.pointsOpp,
				teamName:   leagueTableInstance.teamName,
				teamLogo:   team.logoFile
			]

			jsonList.add(jsonLeagueTableInstance);
		}

        render jsonList as JSON;
	}
}
