package dd.project.wolverine.frontend

import dd.project.wolverine.HomeStadium
import org.springframework.dao.DataIntegrityViolationException

class HomeStadiumController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [homeStadiumInstanceList: HomeStadium.list(params), homeStadiumInstanceTotal: HomeStadium.count()]
    }

	def show(Long id) {
		def homeStadiumInstance = HomeStadium.get(id)
		if (!homeStadiumInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'homeStadium.label', default: 'HomeStadium'), id])
			redirect(action: "list")
			return
		}

		[homeStadiumInstance: homeStadiumInstance]
	}

/*
	def create() {
        [homeStadiumInstance: new HomeStadium(params)]
    }

    def save() {
        def homeStadiumInstance = new HomeStadium(params)
        if (!homeStadiumInstance.save(flush: true)) {
            render(view: "create", model: [homeStadiumInstance: homeStadiumInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'homeStadium.label', default: 'HomeStadium'), homeStadiumInstance.id])
        redirect(action: "show", id: homeStadiumInstance.id)
    }

    def edit(Long id) {
        def homeStadiumInstance = HomeStadium.get(id)
        if (!homeStadiumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'homeStadium.label', default: 'HomeStadium'), id])
            redirect(action: "list")
            return
        }

        [homeStadiumInstance: homeStadiumInstance]
    }

    def update(Long id, Long version) {
        def homeStadiumInstance = HomeStadium.get(id)
        if (!homeStadiumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'homeStadium.label', default: 'HomeStadium'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (homeStadiumInstance.version > version) {
                homeStadiumInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'homeStadium.label', default: 'HomeStadium')] as Object[],
                          "Another user has updated this HomeStadium while you were editing")
                render(view: "edit", model: [homeStadiumInstance: homeStadiumInstance])
                return
            }
        }

        homeStadiumInstance.properties = params

        if (!homeStadiumInstance.save(flush: true)) {
            render(view: "edit", model: [homeStadiumInstance: homeStadiumInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'homeStadium.label', default: 'HomeStadium'), homeStadiumInstance.id])
        redirect(action: "show", id: homeStadiumInstance.id)
    }

    def delete(Long id) {
        def homeStadiumInstance = HomeStadium.get(id)
        if (!homeStadiumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'homeStadium.label', default: 'HomeStadium'), id])
            redirect(action: "list")
            return
        }

        try {
            homeStadiumInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'homeStadium.label', default: 'HomeStadium'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'homeStadium.label', default: 'HomeStadium'), id])
            redirect(action: "show", id: id)
        }
    }
*/
}
