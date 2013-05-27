package dd.project.wolverine

class CoachSeason {

    Coach           coach
    CoachCategory   category
    Integer         season
    Integer         sort
    String          title

    static belongsTo = [coach:Coach, category:CoachCategory]

    static mapping = {
        sort "season"
        version false
    }

    static constraints = {
    }

    String toString() {
        return season + ": " + coach + " (" + title + " " + category + ")"
    }
}
