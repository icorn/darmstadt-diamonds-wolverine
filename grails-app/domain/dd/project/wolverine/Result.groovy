package dd.project.wolverine

class Result {

    String  league
    String  home
    String  guest
    String  result
	Date    date

    static mapping = {
        sort "league"
        version false
    }

    static constraints = {
        league (nullable:true)
	    home   (nullable:true)
	    guest  (nullable:true)
	    result (nullable:true)
	    date   (nullable:true)
    }

    String toString() {
        return league + ": " + home + " vs. " + guest
    }
}
