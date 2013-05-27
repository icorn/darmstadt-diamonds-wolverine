package dd.project.wolverine

class ScoreType {

    String  name
    String  shortName
    Integer points

    static mapping = {
        version false
    }

    static constraints = {
    }

    String toString() {
        return name
    }

}
