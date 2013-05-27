package dd.project.wolverine

class LeagueTable {

    Integer     position
    Integer     season
    Team        team
    String      teamName
    Date        stamp

    Integer     wins
    Integer     ties
    Integer     losses
    Integer     pointsMade
    Integer     pointsOpp

    static mapping = {
        version false
    }

    static constraints = {
        position    (nullable:true)
        season      (nullable:false)
        team        (nullable:true)
        teamName    (nullable:true, blank:false)
        stamp       (nullable:false)
        wins        (nullable:true)
        ties        (nullable:true)
        losses      (nullable:true)
        pointsMade  (nullable:true)
        pointsOpp   (nullable:true)
    }
}
