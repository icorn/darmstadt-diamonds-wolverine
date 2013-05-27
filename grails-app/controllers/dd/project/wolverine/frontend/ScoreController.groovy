package dd.project.wolverine.frontend

import dd.project.wolverine.Player
import dd.project.wolverine.Score
import dd.project.wolverine.constants.Const
import org.springframework.dao.DataIntegrityViolationException


class ScoreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    def index() {
        redirect(action: "list", params: params)
    }


	def show(Long id) {
		def scoreInstance = Score.get(id)
		if (!scoreInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'score.label', default: 'Score'), id])
			redirect(action: "list")
			return
		}

		[scoreInstance: scoreInstance]
	}


	def list() {
		def crit = Score.createCriteria()

		// find out correct year
		def year

		if (params.season == null)
			year = ((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.currentYear
		else
		{
			try {
				year = Integer.parseInt(params.season)
			}
			catch (NumberFormatException ex) {
				// no valid number for season: get current season
				year = ((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.currentYear
			}
		}

		// select all scores of the year
		Date startDate = new GregorianCalendar(year, 0, 1).getTime();
		Date endDate = new GregorianCalendar(year, 11, 31).getTime();

		if (year == 0)
			endDate = new GregorianCalendar(3000, 11, 31).getTime();

		def scoreInstanceList = crit.list {
			game {
				between('date', startDate, endDate)
			}

			order('player', 'asc')
		}

		// calculate the sum of scores for each player

		HashMap<Player, Map> playerScoreHash = new HashMap<>()

		for (scoreInstance in scoreInstanceList)
		{
			def playerScore = playerScoreHash.get(scoreInstance.player)

			if (playerScore == null)
				playerScore = [ td:0, fg:0,	pat:0, conv:0, saf:0, points:0 ]

			switch (scoreInstance.scoreType.id)
			{
				case 0:
					playerScore["td"]++;
					playerScore["points"] += 6
					break
				case 1:
					playerScore["fg"]++;
					playerScore["points"] += 3
					break
				case 2:
					playerScore["pat"]++;
					playerScore["points"] += 1
					break
				case 3:
					playerScore["conv"]++;
					playerScore["points"] += 2
					break
				case 4:
					playerScore["saf"]++;
					playerScore["points"] += 2
					break
			}

			playerScoreHash[scoreInstance.player] = playerScore
		}

		// now we have a hashmap of players and their scores.
		// we have to sort it now.

		def scorerList = sortScorerHash(playerScoreHash)

		[scorerList: scorerList, year:year]
	}


	/**
	 * Sorts a given scorer-hashmap by points. BEWARE: Input-table is empty after use!
	 *
	 * @param unsorted  the unsorted hashtable
	 *
	 * @return the new sorted Vector
	 */
	private final Vector sortScorerHash(HashMap<Player, Map> unsorted)
	{
		if (unsorted == null)
			return new Vector();

		Vector sorted = new Vector(unsorted.size());
		Player playerObject

		while (unsorted.size() > 0)
		{
			// get highest score
			playerObject = getHighestScorer(unsorted);

			// get corresponding entry from unsorted hashmap
			def playerScoreObject = unsorted[playerObject]

			// remove score from unsorted hashmap
			unsorted.remove(playerObject);

			// nebenbei noch die URL des Spielerbilds korrigieren
			if (playerObject?.image?.length() > 0)
				playerObject?.image = playerObject?.image?.substring(playerObject?.image?.lastIndexOf("/")+1)

			playerScoreObject.player = playerObject

			sorted.add(playerScoreObject);
		}

		// Now "sorted" is sorted correctly, but scorers with the same score should get the same position.
		// Let's do that now.

		int oldScore = 1000000;
		int oldPosition = -1;
		int index = 1;

		Iterator iter = sorted.iterator()
		Object playerScoreObject

		if (iter)
		{
			while (iter.hasNext())
			{
				playerScoreObject = iter.next()

				if (playerScoreObject["points"] < oldScore)
				{
					// this player has less points than his predecessor
					playerScoreObject["position"] = index
					oldPosition = index
				}
				else
				{
					// this player has the same score than his predecessor
					playerScoreObject["position"] = oldPosition
				}

				index++
				oldScore = playerScoreObject["points"];
			}
		}

		return sorted;
	}


	private final Player getHighestScorer(HashMap<Player, Map> hash)
	{
		int maxScore = -1
		Player maxScorePlayer = null

		hash.each{ player, playerScoreObject ->
			if (playerScoreObject.points > maxScore)
			{
				maxScore = playerScoreObject.points
				maxScorePlayer = player
			}
		}

		return maxScorePlayer
	}


/*

    def create() {
        [scoreInstance: new Score(params)]
    }

    def save() {
        def scoreInstance = new Score(params)
        if (!scoreInstance.save(flush: true)) {
            render(view: "create", model: [scoreInstance: scoreInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'score.label', default: 'Score'), scoreInstance.id])
        redirect(action: "show", id: scoreInstance.id)
    }

    def edit(Long id) {
        def scoreInstance = Score.get(id)
        if (!scoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'score.label', default: 'Score'), id])
            redirect(action: "list")
            return
        }

        [scoreInstance: scoreInstance]
    }

    def update(Long id, Long version) {
        def scoreInstance = Score.get(id)
        if (!scoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'score.label', default: 'Score'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (scoreInstance.version > version) {
                scoreInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'score.label', default: 'Score')] as Object[],
                          "Another user has updated this Score while you were editing")
                render(view: "edit", model: [scoreInstance: scoreInstance])
                return
            }
        }

        scoreInstance.properties = params

        if (!scoreInstance.save(flush: true)) {
            render(view: "edit", model: [scoreInstance: scoreInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'score.label', default: 'Score'), scoreInstance.id])
        redirect(action: "show", id: scoreInstance.id)
    }

    def delete(Long id) {
        def scoreInstance = Score.get(id)
        if (!scoreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'score.label', default: 'Score'), id])
            redirect(action: "list")
            return
        }

        try {
            scoreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'score.label', default: 'Score'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'score.label', default: 'Score'), id])
            redirect(action: "show", id: id)
        }
    }

*/

}
