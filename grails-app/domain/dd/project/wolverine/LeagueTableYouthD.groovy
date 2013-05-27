package dd.project.wolverine

class LeagueTableYouthD {

    Integer     position
    String      teamName
    Date        stamp

    Integer     wins
    Integer     ties
    Integer     losses
    Integer     pointsMade
    Integer     pointsOpp

    static mapping = {
        version false
        table 'league_table_youth_d'
    }

    static constraints = {
        position    (nullable:true)
        teamName    (nullable:true, blank:false)
        stamp       (nullable:false)
        wins        (nullable:true)
        ties        (nullable:true)
        losses      (nullable:true)
        pointsMade  (nullable:true)
        pointsOpp   (nullable:true)
    }
}
