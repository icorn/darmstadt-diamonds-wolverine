package dd.project.wolverine.frontend

import com.sun.syndication.feed.synd.SyndImageImpl
import dd.project.wolverine.Game
import dd.project.wolverine.News
import dd.project.wolverine.NewsCategory
import dd.project.wolverine.System
import dd.project.wolverine.Util
import grails.converters.JSON

//import groovy.xml.MarkupBuilder


class NewsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 6, 100)
        params.sort = "date"
        params.order = "desc"

		def featuredGameId = System.get(1)?.featuredGame
		def featuredGame = null

	    if (featuredGameId > 0)
			featuredGame = Game.get(featuredGameId)

        [newsInstanceList: News.findAllByHide(0, params), newsInstanceTotal: News.countByHide(0), isTitlePage: true, featuredGame: featuredGame]
    }

	def listFirst = {
		params.max = Math.min(params.max ? params.int('max') : 6, 100)
		params.sort = "date"
		params.order = "desc"

		def newsCategory = new NewsCategory();
		newsCategory.id = 1;

		def newsList = News.findAllByHideAndCategory(0, newsCategory, params);
		def counter = News.countByHideAndCategory(0, newsCategory);

		render(view: "list", model: [newsInstanceList: newsList, newsInstanceTotal: counter, title: "Herrenteam", isTitlePage: false]);
	}

	def listYouth = {
		params.max = Math.min(params.max ? params.int('max') : 6, 100)
		params.sort = "date"
		params.order = "desc"

		def newsCategory = new NewsCategory();
		newsCategory.id = 2;

		def newsList = News.findAllByHideAndCategory(0, newsCategory, params);
		def counter = News.countByHideAndCategory(0, newsCategory);

		render(view: "list", model: [newsInstanceList: newsList, newsInstanceTotal: counter, title: "Jugendteams", isTitlePage: false]);
	}

	def show = {
		def newsInstance = News.get(params.id)
		if (!newsInstance) {
//			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
			redirect(action: "list")
		}
		else {
			[newsInstance: newsInstance]
		}
	}

	def listJson = {
		params.max = Math.min(params.max ? params.int('max') : 6, 100)
		params.sort = "date"
		params.order = "desc"

		def newsList = News.findAllByHide(0, params);
		def jsonList = [];

		if (newsList)
		{
			for (news in newsList)
			{
				def jsonNews = [
				        id:                 news?.id,
						date:               Util.dateToJsonString(news?.date),
						headline:           news?.headline,
						hide:               news?.hide,
						imageFile:          news?.imageFile,
						imageHeaderFile:    news?.imageHeaderFile,
						text:               news?.text,
						linkExtern:         news?.linkExtern,
						linkExternTitle:    news?.linkExternTitle,
						linkMisc:           news?.linkMisc,
						linkMiscTitle:      news?.linkMiscTitle,
						linkStoryId:        news?.linkStoryId,
						linkStoryTitle:     news?.linkStoryTitle,
						linkYouthAGameId:   news?.linkYouthAGameId,
						linkGameId:         news?.linkGameId,
						category:           news?.category?.nameGerman

//						linkGame:           news?.linkGame,
//						linkEvent:          news?.linkEvent,
//						linkEventTitle:     news?.linkEventTitle,
//						eventImagesDir:     news?.eventImagesDir
				]

				jsonList.add(jsonNews)
			}

		}

		render jsonList as JSON;
	}

	def showJson = {
		def newsInstance = News.get(params.id)

		def jsonNews = [
				id:                 newsInstance?.id,
				date:               Util.dateToJsonString(newsInstance?.date),
				headline:           newsInstance?.headline,
				hide:               newsInstance?.hide,
				imageFile:          newsInstance?.imageFile,
				imageHeaderFile:    newsInstance?.imageHeaderFile,
				linkExtern:         newsInstance?.linkExtern,
				linkExternTitle:    newsInstance?.linkExternTitle,
				linkMisc:           newsInstance?.linkMisc,
				linkMiscTitle:      newsInstance?.linkMiscTitle,
				linkStory:          newsInstance?.linkStory,
				linkStoryTitle:     newsInstance?.linkStoryTitle,
				linkYouthAGame:     newsInstance?.linkYouthAGame,
				text:               newsInstance?.text,
				linkGameId:         newsInstance?.linkGameId,
				category:           newsInstance?.category?.nameGerman

//						linkGame:           newsInstance?.linkGame,
//						linkEvent:          newsInstance?.linkEvent,
//						linkEventTitle:     newsInstance?.linkEventTitle,
//						eventImagesDir:     newsInstance?.eventImagesDir
		]

		render jsonNews as JSON;
	}


	def rss = {
		params.max = 10
		params.sort = "date"
		params.order = "desc"

		def newsInstanceList = News.findAllByHide(0, params)

		render(feedType:"rss", feedVersion:"2.0") {
			title = "Darmstadt Diamonds"
			link = "http://www.darmstadt-diamonds.de/d/news/rss"
			description = "Alle News und Infos rund um das American Football-Team der Darmstadt Diamonds"
			language = "de-de"
			copyright = "Copyright by Darmstadt Diamonds and Darmstädter TSG 1846"
			image = new SyndImageImpl(url:'http://www.darmstadt-diamonds.de/images/system/dia_rss.png', title:'Darmstadt Diamonds', link:'http://www.darmstadt-diamonds.de')

			newsInstanceList.each() { item ->
				entry() {
					title = item.headline
					publishedDate = new Date()
					link = "http://www.darmstadt-diamonds.de/d/news/show/${item.id}"
					item.text
				}
			}
		}
	}

	def showDanceteamBooking = { [] }
	def showFoerdervereinInfo = { [] }
	def showPressInfo = { [] }
	def showImpressum = { [] }
	def showTSG = { [] }
	def showFanshop = { [] }
	def showRules = { [] }
	def showMedicine = { [] }
	def showManagement = { [] }
	def showPartners = { [] }
	def showDonations = { [] }
	def showContact = { [] }
	def showTickets = { [] }
	def showPressPhotos = { [] }

/*
	def create = {
        def newsInstance = new News()
        newsInstance.properties = params
        return [newsInstance: newsInstance]
    }

    def save = {
        def newsInstance = new News(params)
        if (newsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'news.label', default: 'News'), newsInstance.id])}"
            redirect(action: "show", id: newsInstance.id)
        }
        else {
            render(view: "create", model: [newsInstance: newsInstance])
        }
    }

	def edit = {
        def newsInstance = News.get(params.id)
        if (!newsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [newsInstance: newsInstance]
        }
    }

    def update = {
        def newsInstance = News.get(params.id)
        if (newsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (newsInstance.version > version) {
                    
                    newsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'news.label', default: 'News')] as Object[], "Another user has updated this News while you were editing")
                    render(view: "edit", model: [newsInstance: newsInstance])
                    return
                }
            }
            newsInstance.properties = params
            if (!newsInstance.hasErrors() && newsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'news.label', default: 'News'), newsInstance.id])}"
                redirect(action: "show", id: newsInstance.id)
            }
            else {
                render(view: "edit", model: [newsInstance: newsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def newsInstance = News.get(params.id)
        if (newsInstance) {
            try {
                newsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
            redirect(action: "list")
        }
    }
*/
}
