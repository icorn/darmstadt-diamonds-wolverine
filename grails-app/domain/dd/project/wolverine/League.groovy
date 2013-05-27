package dd.project.wolverine

class League {

    String  leagueNameGerman
    String  leagueNameEnglish

    static mapping = {
        version false
    }

    static constraints = {
    }

    String toString() {
        return leagueNameGerman
    }
}
