package dd.project.wolverine

class PlayerSeason {

    Player  player
    Integer year

    static belongsTo = [player:Player]

    static mapping = {
        version false
	    player lazy: false
    }

    static constraints = {
    }

    String toString() {
        return year
    }
}
