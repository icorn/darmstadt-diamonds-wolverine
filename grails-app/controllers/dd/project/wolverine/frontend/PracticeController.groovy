package dd.project.wolverine.frontend

import dd.project.wolverine.HomeStadium
import dd.project.wolverine.Practice
import dd.project.wolverine.PracticeCategory
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class PracticeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	static days = ["", "Mo.", "Di.", "Mi.", "Do.", "Fr.", "Sa.", "So."]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
	    def crit = Practice.createCriteria()
	    def categoryInstance = null

	    if (params?.category?.isNumber())
		    categoryInstance = PracticeCategory.get(params.category)

	    def practiceInstanceList = crit.list {
		    and {
			    if (categoryInstance)
				    eq('category', categoryInstance)

			    order('category', 'asc')
			    order('day', 'asc')
			    order('starttime', 'asc')
		    }
	    }

	    for (practiceInstance in practiceInstanceList)
	    {
		    practiceInstance.completeDate =
			    ((practiceInstance?.day >= 0 && practiceInstance?.day <= 7) ? days[practiceInstance.day]+", " : "") +
					    practiceInstance?.starttime + " bis " + practiceInstance?.endtime + ", "
	    }

        [practiceInstanceList: practiceInstanceList]
    }

	def show(Long id) {
		def practiceInstance = Practice.get(id)
		if (!practiceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'practice.label', default: 'Practice'), id])
			redirect(action: "list")
			return
		}

		[practiceInstance: practiceInstance]
	}

	def showDanceteamInfo() {
		params.sort = "day"
		params.order = "asc"
		def practiceCategoryInstance = PracticeCategory.get(5)
		def practiceInstanceList = Practice.findAllByCategory(practiceCategoryInstance, params)

		for (practiceInstance in practiceInstanceList)
		{
			practiceInstance.completeDate =
				((practiceInstance?.day >= 0 && practiceInstance?.day <= 7) ? days[practiceInstance.day]+", " : "") +
				practiceInstance?.starttime + " bis " + practiceInstance?.endtime + ", "
		}

		[practiceInstanceList: practiceInstanceList]
	}

	def showFirstInfo() {
		params.sort = "day"
		params.order = "asc"
		def practiceCategoryInstance = PracticeCategory.get(1)
		def practiceInstanceList = Practice.findAllByCategory(practiceCategoryInstance, params)

		for (practiceInstance in practiceInstanceList)
		{
			practiceInstance.completeDate =
				((practiceInstance?.day >= 0 && practiceInstance?.day <= 7) ? days[practiceInstance.day]+", " : "") +
						practiceInstance?.starttime + " bis " + practiceInstance?.endtime + ", "
		}

		[practiceInstanceList: practiceInstanceList]
	}

	def showYouthInfo() {
		params.sort = "day"
		params.order = "asc"
		def practiceInstanceList = Practice.findAll(params)

		for (practiceInstance in practiceInstanceList)
		{
			practiceInstance.completeDate =
				((practiceInstance?.day >= 0 && practiceInstance?.day <= 7) ? days[practiceInstance.day]+", " : "") +
						practiceInstance?.starttime + " bis " + practiceInstance?.endtime + ", "
		}

		[practiceInstanceList: practiceInstanceList]
	}

	def listJson() {
		def crit = Practice.createCriteria()
		def categoryInstance = null

		if (params?.category?.isNumber())
			categoryInstance = PracticeCategory.get(params.category)

		def practiceInstanceList = crit.list {
			and {
				if (categoryInstance)
					eq('category', categoryInstance)

				order('category', 'asc')
				order('day', 'asc')
				order('starttime', 'asc')
			}
		}

		// make the output list pretty for json
		def jsonList = []

		for (practiceInstance in practiceInstanceList)
		{
			def practiceJson = [
					team:           PracticeCategory.get(practiceInstance.categoryId)?.nameGerman,
					day:            (practiceInstance?.day >= 0 && practiceInstance?.day <= 7) ? days[practiceInstance.day] : null,
					starttime:      practiceInstance?.starttime,
					endtime:        practiceInstance?.endtime,
					facility:       practiceInstance?.facilityName,
					address:        practiceInstance?.facility?.address,
					comment:        practiceInstance?.comment
			]

			jsonList.add(practiceJson)
		}

		render jsonList as JSON;
	}


/*
    def create() {
        [practiceInstance: new Practice(params)]
    }

    def save() {
        def practiceInstance = new Practice(params)
        if (!practiceInstance.save(flush: true)) {
            render(view: "create", model: [practiceInstance: practiceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'practice.label', default: 'Practice'), practiceInstance.id])
        redirect(action: "show", id: practiceInstance.id)
    }

    def edit(Long id) {
        def practiceInstance = Practice.get(id)
        if (!practiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'practice.label', default: 'Practice'), id])
            redirect(action: "list")
            return
        }

        [practiceInstance: practiceInstance]
    }

    def update(Long id, Long version) {
        def practiceInstance = Practice.get(id)
        if (!practiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'practice.label', default: 'Practice'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (practiceInstance.version > version) {
                practiceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'practice.label', default: 'Practice')] as Object[],
                          "Another user has updated this Practice while you were editing")
                render(view: "edit", model: [practiceInstance: practiceInstance])
                return
            }
        }

        practiceInstance.properties = params

        if (!practiceInstance.save(flush: true)) {
            render(view: "edit", model: [practiceInstance: practiceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'practice.label', default: 'Practice'), practiceInstance.id])
        redirect(action: "show", id: practiceInstance.id)
    }

    def delete(Long id) {
        def practiceInstance = Practice.get(id)
        if (!practiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'practice.label', default: 'Practice'), id])
            redirect(action: "list")
            return
        }

        try {
            practiceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'practice.label', default: 'Practice'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'practice.label', default: 'Practice'), id])
            redirect(action: "show", id: id)
        }
    }
*/
}
