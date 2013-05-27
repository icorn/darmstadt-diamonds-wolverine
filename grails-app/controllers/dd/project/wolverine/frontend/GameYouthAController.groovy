package dd.project.wolverine.frontend

import dd.project.wolverine.GameCategory
import dd.project.wolverine.GameYouthA
import dd.project.wolverine.LeagueTableYouthA
import dd.project.wolverine.constants.Const
import dd.project.wolverine.constants.GameCategoryId
import dd.project.wolverine.System


class GameYouthAController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	private GameYouthA[] selectSchedule(gameCategory, season) {
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

		def list = GameYouthA.findAllByCategoryAndDateBetween(GameCategory.get(gameCategory), startDate.getTime(), endDate.getTime(), params)

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
			leagueTableInstanceList: LeagueTableYouthA.findAll([sort:"position", order:"asc"]),
			youthname: "A-Jugend",
			empty: empty
		];
	}


	def show(Long id) {
		def gameYouthAInstance = GameYouthA.get(id)
		if (!gameYouthAInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthA.label', default: 'GameYouthA'), id])
			redirect(action: "list")
			return
		}

		[gameYouthAInstance: gameYouthAInstance]
	}

/*
	def create() {
		[gameYouthAInstance: new GameYouthA(params)]
	}


	def save() {
        def gameYouthAInstance = new GameYouthA(params)
        if (!gameYouthAInstance.save(flush: true)) {
            render(view: "create", model: [gameYouthAInstance: gameYouthAInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gameYouthA.label', default: 'GameYouthA'), gameYouthAInstance.id])
        redirect(action: "show", id: gameYouthAInstance.id)
    }

    def edit(Long id) {
        def gameYouthAInstance = GameYouthA.get(id)
        if (!gameYouthAInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthA.label', default: 'GameYouthA'), id])
            redirect(action: "list")
            return
        }

        [gameYouthAInstance: gameYouthAInstance]
    }

    def update(Long id, Long version) {
        def gameYouthAInstance = GameYouthA.get(id)
        if (!gameYouthAInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthA.label', default: 'GameYouthA'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gameYouthAInstance.version > version) {
                gameYouthAInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gameYouthA.label', default: 'GameYouthA')] as Object[],
                          "Another user has updated this GameYouthA while you were editing")
                render(view: "edit", model: [gameYouthAInstance: gameYouthAInstance])
                return
            }
        }

        gameYouthAInstance.properties = params

        if (!gameYouthAInstance.save(flush: true)) {
            render(view: "edit", model: [gameYouthAInstance: gameYouthAInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gameYouthA.label', default: 'GameYouthA'), gameYouthAInstance.id])
        redirect(action: "show", id: gameYouthAInstance.id)
    }

    def delete(Long id) {
        def gameYouthAInstance = GameYouthA.get(id)
        if (!gameYouthAInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthA.label', default: 'GameYouthA'), id])
            redirect(action: "list")
            return
        }

        try {
            gameYouthAInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gameYouthA.label', default: 'GameYouthA'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gameYouthA.label', default: 'GameYouthA'), id])
            redirect(action: "show", id: id)
        }
    }

 */

}
