package dd.project.wolverine.frontend

import dd.project.wolverine.CoachCategory
import dd.project.wolverine.CoachSeason
import dd.project.wolverine.constants.Const
import org.springframework.dao.DataIntegrityViolationException

class CoachSeasonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Long id) {
	    params.sort = "sort"
	    params.order = "asc"

	    def coachCategory = CoachCategory.get(id);
		def coachSeasonInstanceList = CoachSeason.findAllBySeasonAndCategory(((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.currentYear, coachCategory, params)

	    def hideText = false

	    if (id != Const.COACH_CATEGORY_FIRST_TEAM)
		    hideText = true

	    [coachSeasonInstanceList: coachSeasonInstanceList, categoryName: coachCategory?.nameGerman, hideText: hideText]
    }

    def show(Long id) {
        def coachSeasonInstance = CoachSeason.get(id)
        if (!coachSeasonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coachSeason.label', default: 'CoachSeason'), id])
            redirect(action: "list")
            return
        }

        [coachSeasonInstance: coachSeasonInstance]
    }

/*
    def create() {
        [coachSeasonInstance: new CoachSeason(params)]
    }

    def save() {
        def coachSeasonInstance = new CoachSeason(params)
        if (!coachSeasonInstance.save(flush: true)) {
            render(view: "create", model: [coachSeasonInstance: coachSeasonInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'coachSeason.label', default: 'CoachSeason'), coachSeasonInstance.id])
        redirect(action: "show", id: coachSeasonInstance.id)
    }

    def edit(Long id) {
        def coachSeasonInstance = CoachSeason.get(id)
        if (!coachSeasonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coachSeason.label', default: 'CoachSeason'), id])
            redirect(action: "list")
            return
        }

        [coachSeasonInstance: coachSeasonInstance]
    }

    def update(Long id, Long version) {
        def coachSeasonInstance = CoachSeason.get(id)
        if (!coachSeasonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coachSeason.label', default: 'CoachSeason'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (coachSeasonInstance.version > version) {
                coachSeasonInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'coachSeason.label', default: 'CoachSeason')] as Object[],
                          "Another user has updated this CoachSeason while you were editing")
                render(view: "edit", model: [coachSeasonInstance: coachSeasonInstance])
                return
            }
        }

        coachSeasonInstance.properties = params

        if (!coachSeasonInstance.save(flush: true)) {
            render(view: "edit", model: [coachSeasonInstance: coachSeasonInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'coachSeason.label', default: 'CoachSeason'), coachSeasonInstance.id])
        redirect(action: "show", id: coachSeasonInstance.id)
    }

    def delete(Long id) {
        def coachSeasonInstance = CoachSeason.get(id)
        if (!coachSeasonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'coachSeason.label', default: 'CoachSeason'), id])
            redirect(action: "list")
            return
        }

        try {
            coachSeasonInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'coachSeason.label', default: 'CoachSeason'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'coachSeason.label', default: 'CoachSeason'), id])
            redirect(action: "show", id: id)
        }
    }

*/

}
