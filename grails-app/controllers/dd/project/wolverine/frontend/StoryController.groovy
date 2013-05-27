package dd.project.wolverine.frontend

import dd.project.wolverine.Story
import dd.project.wolverine.Util
import dd.project.wolverine.constants.Const
import grails.converters.JSON


class StoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [storyInstanceList: Story.list(params), storyInstanceTotal: Story.count()]
    }

    def show = {
        def storyInstance = Story.get(params.id)
        if (!storyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
            redirect(action: "list")
        }
        else {
            [storyInstance: storyInstance]
        }
    }

	def showJson = {
		def storyInstance = Story.get(params.id)

		if (storyInstance)
		{
			def newsImageFile = null

			if (storyInstance?.news?.imageHeaderFile)
			{
				// If there is a connected news-article, we use the articles header-file as story-picture
				newsImageFile = ((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.absPathNewsHeaderImages + storyInstance?.news?.imageHeaderFile
			}
			else if (storyInstance?.newsImageFile)
			{
				// No news-article: This must be an old story where we use a small image from the story-record
				newsImageFile = ((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.absPathNewsImages + storyInstance?.newsImageFile
			}

			def jsonStoryInstance = [
					id:                 storyInstance?.id,
					headline:           storyInstance?.headline,
					date:               (storyInstance?.news ? Util.dateToJsonString(storyInstance?.news?.date) : Util.dateToJsonString(storyInstance?.date)),
					text:               storyInstance?.text,
					newsImageFile:      newsImageFile,
					otherImageFile:     storyInstance?.otherImageFile,

					linkExtern:         storyInstance?.news?.linkExtern,
					linkExternTitle:    storyInstance?.news?.linkExternTitle,
					linkMisc:           storyInstance?.news?.linkMisc,
					linkMiscTitle:      storyInstance?.news?.linkMiscTitle,
					linkYouthAGame:     storyInstance?.news?.linkYouthAGame,
					linkGameId:         storyInstance?.news?.linkGameId,
					category:           storyInstance?.news?.category?.nameGerman
			]

			render jsonStoryInstance as JSON
		}

	}

/*

    def create = {
        def storyInstance = new Story()
        storyInstance.properties = params
        return [storyInstance: storyInstance]
    }

    def save = {
        def storyInstance = new Story(params)
        if (storyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'story.label', default: 'Story'), storyInstance.id])}"
            redirect(action: "show", id: storyInstance.id)
        }
        else {
            render(view: "create", model: [storyInstance: storyInstance])
        }
    }


	def edit = {
        def storyInstance = Story.get(params.id)
        if (!storyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [storyInstance: storyInstance]
        }
    }

    def update = {
        def storyInstance = Story.get(params.id)
        if (storyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (storyInstance.version > version) {
                    
                    storyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'story.label', default: 'Story')] as Object[], "Another user has updated this Story while you were editing")
                    render(view: "edit", model: [storyInstance: storyInstance])
                    return
                }
            }
            storyInstance.properties = params
            if (!storyInstance.hasErrors() && storyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'story.label', default: 'Story'), storyInstance.id])}"
                redirect(action: "show", id: storyInstance.id)
            }
            else {
                render(view: "edit", model: [storyInstance: storyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def storyInstance = Story.get(params.id)
        if (storyInstance) {
            try {
                storyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'story.label', default: 'Story'), params.id])}"
            redirect(action: "list")
        }
    }
*/
}
