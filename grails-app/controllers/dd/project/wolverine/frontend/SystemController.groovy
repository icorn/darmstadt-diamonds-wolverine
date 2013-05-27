package dd.project.wolverine.frontend

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class SystemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [systemInstanceList: dd.project.wolverine.System.list(params), systemInstanceTotal: dd.project.wolverine.System.count()]
    }

    def show(Long id) {
        def systemInstance = dd.project.wolverine.System.get(id)
        if (!systemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'system.label', default: 'System'), id])
            redirect(action: "list")
            return
        }

        [systemInstance: systemInstance]
    }

	def getJson() {
		def systemInstance = dd.project.wolverine.System.get(1)

		def jsonObject = [
				featuredGame:               systemInstance?.featuredGame,
				currentYear:                systemInstance?.currentYear,

				absPathNewsImages:          systemInstance?.absPathNewsImages,
				absPathNewsHeaderImages:    systemInstance?.absPathNewsHeaderImages,
				absPathCoachesImages:       systemInstance?.absPathCoachesImages,
				absPathPlayersImages:       systemInstance?.absPathPlayersImages,
				absPathYouthaImages:        systemInstance?.absPathYouthaImages,
				absPathTeamLogos:           systemInstance?.absPathTeamLogos,
				absPathStadiumsImages:      systemInstance?.absPathStadiumsImages,
				absPathPressImages:         systemInstance?.absPathPressImages,
				absPathPartnerLogos:        systemInstance?.absPathPartnerLogos,
				absPathAmazonImages:        systemInstance?.absPathAmazonImages,
				absPathTeamzone:            systemInstance?.absPathTeamzone,
				absPathStats:               systemInstance?.absPathStats,
				absPathUnknownPlayerImage:  systemInstance?.absPathUnknownPlayerImage,
				absPathInfoBanner:          systemInstance?.absPathInfoBanner,
				absPathGameImages:          systemInstance?.absPathGameImages,

				jsonUrlTable:               systemInstance?.jsonUrl + systemInstance?.jsonUrlTable,
				jsonUrlNewslist:            systemInstance?.jsonUrl + systemInstance?.jsonUrlNewslist,
				jsonUrlNewsitem:            systemInstance?.jsonUrl + systemInstance?.jsonUrlNewsitem,
				jsonUrlStory:               systemInstance?.jsonUrl + systemInstance?.jsonUrlStory,
				jsonUrlSchedule:            systemInstance?.jsonUrl + systemInstance?.jsonUrlSchedule,
				jsonUrlRoster:              systemInstance?.jsonUrl + systemInstance?.jsonUrlRoster,

				jsonUrlGame:                systemInstance?.jsonUrl + systemInstance?.jsonUrlGame,
				jsonUrlPractice:            systemInstance?.jsonUrl + systemInstance?.jsonUrlPractice
		]

		render jsonObject as JSON;
	}




/*
    def create() {
        [systemInstance: new dd.project.wolverine.System(params)]
    }

    def save() {
        def systemInstance = new dd.project.wolverine.System(params)
        if (!systemInstance.save(flush: true)) {
            render(view: "create", model: [systemInstance: systemInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'system.label', default: 'System'), systemInstance.id])
        redirect(action: "show", id: systemInstance.id)
    }

    def edit(Long id) {
        def systemInstance = dd.project.wolverine.System.get(id)
        if (!systemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'system.label', default: 'System'), id])
            redirect(action: "list")
            return
        }

        [systemInstance: systemInstance]
    }

    def update(Long id, Long version) {
        def systemInstance = dd.project.wolverine.System.get(id)
        if (!systemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'system.label', default: 'System'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (systemInstance.version > version) {
                systemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'system.label', default: 'System')] as Object[],
                          "Another user has updated this System while you were editing")
                render(view: "edit", model: [systemInstance: systemInstance])
                return
            }
        }

        systemInstance.properties = params

        if (!systemInstance.save(flush: true)) {
            render(view: "edit", model: [systemInstance: systemInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'system.label', default: 'System'), systemInstance.id])
        redirect(action: "show", id: systemInstance.id)
    }

    def delete(Long id) {
        def systemInstance = dd.project.wolverine.System.get(id)
        if (!systemInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'system.label', default: 'System'), id])
            redirect(action: "list")
            return
        }

        try {
            systemInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'system.label', default: 'System'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'system.label', default: 'System'), id])
            redirect(action: "show", id: id)
        }
    }

*/
}
