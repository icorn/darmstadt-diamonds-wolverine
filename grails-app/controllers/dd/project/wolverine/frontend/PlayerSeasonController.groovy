package dd.project.wolverine.frontend

import dd.project.wolverine.Coach
import dd.project.wolverine.CoachCategory
import dd.project.wolverine.CoachSeason
import dd.project.wolverine.Player
import dd.project.wolverine.PlayerSeason
import dd.project.wolverine.Util
import dd.project.wolverine.constants.Const
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class PlayerSeasonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	def list = {
		params.sort = "player.number"
		params.order = "asc"

		def playerSeasonInstanceList = PlayerSeason.findAllByYear(((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.currentYear?.intValue(), params)
		def playerInstance
		def newList = [];

		// Fix image-url and add players who have a number to the new list
		for (playerSeason in playerSeasonInstanceList)
		{
			playerInstance = Player.get(playerSeason.playerId)

			if (playerInstance?.number != null)
			{
				if (playerInstance?.image?.length() > 0)
					playerSeason?.player?.image = playerInstance?.image?.substring(playerInstance?.image?.lastIndexOf("/")+1)

				newList.add(playerSeason)
			}
		}

		// Fix image-url and add players who have *no* number to the new list
		for (playerSeason in playerSeasonInstanceList)
		{
			playerInstance = Player.get(playerSeason.playerId)

			if (playerInstance?.number == null)
			{
				if (playerInstance?.image?.length() > 0)
					playerSeason?.player?.image = playerInstance?.image?.substring(playerInstance?.image?.lastIndexOf("/")+1)

				newList.add(playerSeason)
			}
		}

		[playerSeasonInstanceList: newList]
	}

	def listJson = {
		params.sort = "player.number"
		params.order = "asc"

		// get all players from the current year
		def playerSeasonInstanceList = PlayerSeason.findAllByYear(((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.currentYear?.intValue(), params)
		def jsonList = []
		def playerInstance;
		def imageUrl;

		// create a list with all the players
		for (playerSeason in playerSeasonInstanceList)
		{
			playerInstance = Player.get(playerSeason.playerId)
			imageUrl = "";

			if (playerInstance?.image?.length() > 0)
				imageUrl = playerInstance?.image?.substring(playerInstance?.image?.lastIndexOf("/")+1)

			def playerJson = [
					firstname:      playerInstance?.firstname,
					lastname:       playerInstance?.lastname,
					nickname:       playerInstance?.nickname,
					dateOfBirth:    Util.dateToJsonString(playerInstance?.dateOfBirth),
					position:       playerInstance?.position,
					number:         playerInstance?.number,
					height:         playerInstance?.height,
					weight:         playerInstance?.weight,
					image:          imageUrl,
					coach:          false
			]

			jsonList.add(playerJson)
		}

		// add the coaches
		params.sort = "sort"
		params.order = "asc"
		def coachSeasonInstanceList = CoachSeason.findAllBySeasonAndCategory(((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.currentYear?.intValue(), CoachCategory.get(1), params)
		def coachInstance

		for (coachSeason in coachSeasonInstanceList)
		{
			coachInstance = Coach.get(coachSeason.coachId)
			imageUrl = "";

			if (coachInstance?.image?.length() > 0)
				imageUrl = coachInstance?.image?.substring(coachInstance?.image?.lastIndexOf("/")+1)

			def coachJson = [
					firstname:      coachInstance?.firstname,
					lastname:       coachInstance?.lastname,
					nickname:       coachInstance?.text,
					dateOfBirth:    null,
					position:       coachSeason?.title,
					number:         null,
					height:         null,
					weight:         null,
					image:          imageUrl,
					coach:          true
			]

			jsonList.add(coachJson)
		}

		render jsonList as JSON;
	}



	def show(Long id) {
		def playerSeasonInstance = PlayerSeason.get(id)
		if (!playerSeasonInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'playerSeason.label', default: 'PlayerSeason'), id])
			redirect(action: "list")
			return
		}

		[playerSeasonInstance: playerSeasonInstance]
	}



/*
	def create() {
		[playerSeasonInstance: new PlayerSeason(params)]
	}

	def save() {
		def playerSeasonInstance = new PlayerSeason(params)
		if (!playerSeasonInstance.save(flush: true)) {
			render(view: "create", model: [playerSeasonInstance: playerSeasonInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'playerSeason.label', default: 'PlayerSeason'), playerSeasonInstance.id])
		redirect(action: "show", id: playerSeasonInstance.id)
	}

	def edit(Long id) {
        def playerSeasonInstance = PlayerSeason.get(id)
        if (!playerSeasonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playerSeason.label', default: 'PlayerSeason'), id])
            redirect(action: "list")
            return
        }

        [playerSeasonInstance: playerSeasonInstance]
    }

    def update(Long id, Long version) {
        def playerSeasonInstance = PlayerSeason.get(id)
        if (!playerSeasonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playerSeason.label', default: 'PlayerSeason'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (playerSeasonInstance.version > version) {
                playerSeasonInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'playerSeason.label', default: 'PlayerSeason')] as Object[],
                          "Another user has updated this PlayerSeason while you were editing")
                render(view: "edit", model: [playerSeasonInstance: playerSeasonInstance])
                return
            }
        }

        playerSeasonInstance.properties = params

        if (!playerSeasonInstance.save(flush: true)) {
            render(view: "edit", model: [playerSeasonInstance: playerSeasonInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'playerSeason.label', default: 'PlayerSeason'), playerSeasonInstance.id])
        redirect(action: "show", id: playerSeasonInstance.id)
    }

    def delete(Long id) {
        def playerSeasonInstance = PlayerSeason.get(id)
        if (!playerSeasonInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'playerSeason.label', default: 'PlayerSeason'), id])
            redirect(action: "list")
            return
        }

        try {
            playerSeasonInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'playerSeason.label', default: 'PlayerSeason'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'playerSeason.label', default: 'PlayerSeason'), id])
            redirect(action: "show", id: id)
        }
    }
*/
}
