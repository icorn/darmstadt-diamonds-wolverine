package dd.project.wolverine.frontend

import dd.project.wolverine.GameCategory
import dd.project.wolverine.GameYouthC
import dd.project.wolverine.LeagueTableYouthC
import dd.project.wolverine.constants.Const
import dd.project.wolverine.constants.GameCategoryId
import dd.project.wolverine.System


class GameYouthCController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	private GameYouthC[] selectSchedule(gameCategory, season) {
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

		def list = GameYouthC.findAllByCategoryAndDateBetween(GameCategory.get(gameCategory), startDate.getTime(), endDate.getTime(), params)

		return list
	}


	def list = {
		def list1 = selectSchedule(GameCategoryId.PRE_SEASON.value, params.season)
		def list2 = selectSchedule(GameCategoryId.REGULAR_SEASON.value, params.season)
		def list3 = selectSchedule(GameCategoryId.RELEGATION.value, params.season)
		def list4 = selectSchedule(GameCategoryId.PLAYOFF.value, params.season)
		def list5 = selectSchedule(GameCategoryId.BOWL.value, params.season)

		def empty = false;

		if ((list1.length == 0) && (list2.length == 0) && (list3.length == 0) && (list4.length == 0) && (list5.length == 0))
			empty = true

		[
			gameInstanceList: [ list1, list2, list3, list4, list5 ],
			leagueTableInstanceList: LeagueTableYouthC.findAll([sort:"position", order:"asc"]),
			youthname: "C-Jugend",
			empty: empty
		];
	}


	def show(Long id) {
		def gameYouthCInstance = GameYouthC.get(id)
		if (!gameYouthCInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthC.label', default: 'GameYouthC'), id])
			redirect(action: "list")
			return
		}

		[gameYouthCInstance: gameYouthCInstance]
	}

/*
	def create() {
        [gameYouthCInstance: new GameYouthC(params)]
    }

    def save() {
        def gameYouthCInstance = new GameYouthC(params)
        if (!gameYouthCInstance.save(flush: true)) {
            render(view: "create", model: [gameYouthCInstance: gameYouthCInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gameYouthC.label', default: 'GameYouthC'), gameYouthCInstance.id])
        redirect(action: "show", id: gameYouthCInstance.id)
    }

    def edit(Long id) {
        def gameYouthCInstance = GameYouthC.get(id)
        if (!gameYouthCInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthC.label', default: 'GameYouthC'), id])
            redirect(action: "list")
            return
        }

        [gameYouthCInstance: gameYouthCInstance]
    }

    def update(Long id, Long version) {
        def gameYouthCInstance = GameYouthC.get(id)
        if (!gameYouthCInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthC.label', default: 'GameYouthC'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gameYouthCInstance.version > version) {
                gameYouthCInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gameYouthC.label', default: 'GameYouthC')] as Object[],
                          "Another user has updated this GameYouthC while you were editing")
                render(view: "edit", model: [gameYouthCInstance: gameYouthCInstance])
                return
            }
        }

        gameYouthCInstance.properties = params

        if (!gameYouthCInstance.save(flush: true)) {
            render(view: "edit", model: [gameYouthCInstance: gameYouthCInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gameYouthC.label', default: 'GameYouthC'), gameYouthCInstance.id])
        redirect(action: "show", id: gameYouthCInstance.id)
    }

    def delete(Long id) {
        def gameYouthCInstance = GameYouthC.get(id)
        if (!gameYouthCInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthC.label', default: 'GameYouthC'), id])
            redirect(action: "list")
            return
        }

        try {
            gameYouthCInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gameYouthC.label', default: 'GameYouthC'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gameYouthC.label', default: 'GameYouthC'), id])
            redirect(action: "show", id: id)
        }
    }
*/

}
