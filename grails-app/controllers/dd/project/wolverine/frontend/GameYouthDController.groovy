package dd.project.wolverine.frontend

import dd.project.wolverine.GameCategory
import dd.project.wolverine.GameYouthD
import dd.project.wolverine.LeagueTableYouthD
import dd.project.wolverine.constants.Const
import dd.project.wolverine.constants.GameCategoryId
import dd.project.wolverine.System


class GameYouthDController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	private GameYouthD[] selectSchedule(gameCategory, season) {
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

		def list = GameYouthD.findAllByCategoryAndDateBetween(GameCategory.get(gameCategory), startDate.getTime(), endDate.getTime(), params)

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
			leagueTableInstanceList: LeagueTableYouthD.findAll([sort:"position", order:"asc"]),
			youthname: "Flag-Jugend",
			empty: empty
		];
	}

	def show(Long id) {
		def gameYouthDInstance = GameYouthD.get(id)
		if (!gameYouthDInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthD.label', default: 'GameYouthD'), id])
			redirect(action: "list")
			return
		}

		[gameYouthDInstance: gameYouthDInstance]
	}

/*
    def create() {
        [gameYouthDInstance: new GameYouthD(params)]
    }


	def save() {
        def gameYouthDInstance = new GameYouthD(params)
        if (!gameYouthDInstance.save(flush: true)) {
            render(view: "create", model: [gameYouthDInstance: gameYouthDInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'gameYouthD.label', default: 'GameYouthD'), gameYouthDInstance.id])
        redirect(action: "show", id: gameYouthDInstance.id)
    }

    def edit(Long id) {
        def gameYouthDInstance = GameYouthD.get(id)
        if (!gameYouthDInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthD.label', default: 'GameYouthD'), id])
            redirect(action: "list")
            return
        }

        [gameYouthDInstance: gameYouthDInstance]
    }

    def update(Long id, Long version) {
        def gameYouthDInstance = GameYouthD.get(id)
        if (!gameYouthDInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthD.label', default: 'GameYouthD'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (gameYouthDInstance.version > version) {
                gameYouthDInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'gameYouthD.label', default: 'GameYouthD')] as Object[],
                          "Another user has updated this GameYouthD while you were editing")
                render(view: "edit", model: [gameYouthDInstance: gameYouthDInstance])
                return
            }
        }

        gameYouthDInstance.properties = params

        if (!gameYouthDInstance.save(flush: true)) {
            render(view: "edit", model: [gameYouthDInstance: gameYouthDInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'gameYouthD.label', default: 'GameYouthD'), gameYouthDInstance.id])
        redirect(action: "show", id: gameYouthDInstance.id)
    }

    def delete(Long id) {
        def gameYouthDInstance = GameYouthD.get(id)
        if (!gameYouthDInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'gameYouthD.label', default: 'GameYouthD'), id])
            redirect(action: "list")
            return
        }

        try {
            gameYouthDInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'gameYouthD.label', default: 'GameYouthD'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'gameYouthD.label', default: 'GameYouthD'), id])
            redirect(action: "show", id: id)
        }
    }
*/

}
