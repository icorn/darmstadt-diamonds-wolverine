package dd.project.wolverine.frontend

import dd.project.wolverine.Game
import dd.project.wolverine.GameCategory
import dd.project.wolverine.Team
import dd.project.wolverine.constants.Const
import org.springframework.dao.DataIntegrityViolationException

class TeamController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
	    def startDate = new Date(((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.currentYear?.intValue() - 1900, 0, 1, 0, 0, 0)
	    def endDate = new Date(((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.currentYear?.intValue() - 1900, 11, 31, 23, 59, 59)
	    def gameCategory = GameCategory.get(1)
	    def gameInstanceList = Game.findAllByDateBetweenAndCategory(startDate, endDate, gameCategory)

	    def resultList = []

	    // filter out the Diamonds and double-entries

	    for (gameInstance in gameInstanceList)
	    {
		    if ((gameInstance?.homeTeamId != Const.DIAMONDS_TEAM_ID) && (!resultList?.contains(gameInstance?.homeTeam)))
			    resultList?.add(gameInstance?.homeTeam)
		    if ((gameInstance?.guestTeamId != Const.DIAMONDS_TEAM_ID) && (!resultList?.contains(gameInstance?.guestTeam)))
			    resultList?.add(gameInstance?.guestTeam)
	    }

        [teamInstanceList: resultList]
    }

    def show(Long id) {
        def teamInstance = Team.get(id)
        if (!teamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), id])
            redirect(action: "list")
            return
        }

        [teamInstance: teamInstance]
    }

/*

    def create() {
        [teamInstance: new Team(params)]
    }

    def save() {
        def teamInstance = new Team(params)
        if (!teamInstance.save(flush: true)) {
            render(view: "create", model: [teamInstance: teamInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.id])
        redirect(action: "show", id: teamInstance.id)
    }

    def edit(Long id) {
        def teamInstance = Team.get(id)
        if (!teamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), id])
            redirect(action: "list")
            return
        }

        [teamInstance: teamInstance]
    }

    def update(Long id, Long version) {
        def teamInstance = Team.get(id)
        if (!teamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (teamInstance.version > version) {
                teamInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'team.label', default: 'Team')] as Object[],
                          "Another user has updated this Team while you were editing")
                render(view: "edit", model: [teamInstance: teamInstance])
                return
            }
        }

        teamInstance.properties = params

        if (!teamInstance.save(flush: true)) {
            render(view: "edit", model: [teamInstance: teamInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'team.label', default: 'Team'), teamInstance.id])
        redirect(action: "show", id: teamInstance.id)
    }

    def delete(Long id) {
        def teamInstance = Team.get(id)
        if (!teamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), id])
            redirect(action: "list")
            return
        }

        try {
            teamInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'team.label', default: 'Team'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'team.label', default: 'Team'), id])
            redirect(action: "show", id: id)
        }
    }

*/

}
