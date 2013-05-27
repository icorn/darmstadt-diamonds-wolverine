package dd.project.wolverine.frontend

import dd.project.wolverine.News
import dd.project.wolverine.PushAndroid
import org.json.simple.JSONArray
import org.json.simple.JSONObject
import javax.net.ssl.HttpsURLConnection


class PushAndroidController {

	def pushService

    static allowedMethods = [savePost: "POST", update: "POST", delete: "POST"]


	def savePost()
	{
		def retval

		if (!params.deviceId)
			retval = "error - missing deviceID"
		else if (!params.secret)
			retval = "error - missing secret"
		else if (!params?.secret?.equals("dd4ever!"))
			retval = "error - wrong secret"
		else
		{
			def pushAndroidInstance = PushAndroid.findByDeviceId(params.deviceId)

			if (pushAndroidInstance)
			{
				// update existing entry
				if (params.pushFinal)
					pushAndroidInstance.pushFinal = params.pushFinal.equals("1")

				if (params.pushScores)
					pushAndroidInstance.pushScores = params.pushScores.equals("1")

				if (params.pushNews)
					pushAndroidInstance.pushNews = params.pushNews.equals("1")

				pushAndroidInstance.failCounter = 0
				pushAndroidInstance.updateTime = new Date()
				retval = "update"

				if (!pushAndroidInstance.save(flush: true))
					retval = "error updating"
			}
			else
			{
				// create new entry
				pushAndroidInstance = new PushAndroid(params)
				pushAndroidInstance.createTime = new Date()
				pushAndroidInstance.failCounter = 0;
				retval = "create"

				if (!pushAndroidInstance.save(flush: true))
					retval = "error creating"
			}
		}

		render text: retval, contentType: 'text/plain'
	}


	def pushNews()
	{
		def newsInstance = News.get(378)

		if (newsInstance)
		{
			def url = dd.project.wolverine.System.get(1)?.jsonUrl

			if (newsInstance?.linkStory)
				url += dd.project.wolverine.System.get(1)?.jsonUrlStory + "?id=" + newsInstance?.linkStory?.id
			else
				url += dd.project.wolverine.System.get(1)?.jsonUrlNewsitem + "?id=" + newsInstance?.id

			JSONObject jsonData = new JSONObject();
			jsonData.put("content", "news");
			jsonData.put("ticker", URLEncoder.encode(newsInstance?.headline, "UTF-8"));
			jsonData.put("headline", URLEncoder.encode(newsInstance?.headline, "UTF-8"));
			jsonData.put("message", URLEncoder.encode(newsInstance?.text, "UTF-8"));
			jsonData.put("url", url);

			render text: pushService.pushToAndroid(jsonData, url), contentType: 'text/plain'
		}
		else
		{
			render text: "No News", contentType: 'text/plain'
		}
	}

/*
	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[pushAndroidInstanceList: PushAndroid.list(params), pushAndroidInstanceTotal: PushAndroid.count()]
	}

	def create() {
		[pushAndroidInstance: new PushAndroid(params)]
	}

	def show(Long id) {
        def pushAndroidInstance = PushAndroid.get(id)
        if (!pushAndroidInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pushAndroid.label', default: 'PushAndroid'), id])
            redirect(action: "list")
            return
        }

        [pushAndroidInstance: pushAndroidInstance]
    }

    def edit(Long id) {
        def pushAndroidInstance = PushAndroid.get(id)
        if (!pushAndroidInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pushAndroid.label', default: 'PushAndroid'), id])
            redirect(action: "list")
            return
        }

        [pushAndroidInstance: pushAndroidInstance]
    }

    def update(Long id, Long version) {
        def pushAndroidInstance = PushAndroid.get(id)
        if (!pushAndroidInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pushAndroid.label', default: 'PushAndroid'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pushAndroidInstance.version > version) {
                pushAndroidInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pushAndroid.label', default: 'PushAndroid')] as Object[],
                          "Another user has updated this PushAndroid while you were editing")
                render(view: "edit", model: [pushAndroidInstance: pushAndroidInstance])
                return
            }
        }

        pushAndroidInstance.properties = params

        if (!pushAndroidInstance.save(flush: true)) {
            render(view: "edit", model: [pushAndroidInstance: pushAndroidInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pushAndroid.label', default: 'PushAndroid'), pushAndroidInstance.id])
        redirect(action: "show", id: pushAndroidInstance.id)
    }

    def delete(Long id) {
        def pushAndroidInstance = PushAndroid.get(id)
        if (!pushAndroidInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pushAndroid.label', default: 'PushAndroid'), id])
            redirect(action: "list")
            return
        }

        try {
            pushAndroidInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pushAndroid.label', default: 'PushAndroid'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pushAndroid.label', default: 'PushAndroid'), id])
            redirect(action: "show", id: id)
        }
    }
*/

}
