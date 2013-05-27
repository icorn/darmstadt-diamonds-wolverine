package dd.project.wolverine

class Score {

    Player      player
    Game        game
    ScoreType   scoreType

    static belongsTo = [player:Player, game:Game]

    static mapping = {
        id column : 'score_id'
        version false
    }

    static constraints = {
    }

    String toString() {
        return scoreType.toString() + " von '" + player.toString() + "' in '" + game.toString() + "'"
    }
}
