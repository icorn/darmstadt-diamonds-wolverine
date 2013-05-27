package dd.project.wolverine

import java.text.DateFormat


class GameYouthC {

    String          opponentStadium

	Integer         weekend
    Date            date
    String          time
    HomeStadium     homeStadium
    String          homeTeamName
    String          guestTeamName
    String          preview
    String          report
    GameCategory    category
    String          imageDir
    String          ddPictureUrl

    Integer         homeScore
    Integer         homeQ1
    Integer         homeQ2
    Integer         homeQ3
    Integer         homeQ4
    Integer         homeOt
    Integer         guestScore
    Integer         guestQ1
    Integer         guestQ2
    Integer         guestQ3
    Integer         guestQ4
    Integer         guestOt

    static mapping = {
        table 'game_youth_c'
        version false

        homeStadium column : 'home_stadium'
        homeQ1      column : 'home_q1'
        homeQ2      column : 'home_q2'
        homeQ3      column : 'home_q3'
        homeQ4      column : 'home_q4'
        guestQ1     column : 'guest_q1'
        guestQ2     column : 'guest_q2'
        guestQ3     column : 'guest_q3'
        guestQ4     column : 'guest_q4'

        sort "date"
        order "desc"
    }

    static constraints = {
        opponentStadium (nullable:true)

	    weekend         (nullable:true)
        date            (nullable:false)
        time            (nullable:true)
        homeStadium     (nullable:true)
        homeTeamName    (nullable:true, blank:false)
        guestTeamName   (nullable:true, blank:false)
        preview         (nullable:true)
        report          (nullable:true)
        category        (nullable:false)
        imageDir        (nullable:true)
        ddPictureUrl    (nullable:true, url:true)

        homeScore       (nullable:true)
        homeQ1          (nullable:true)
        homeQ2          (nullable:true)
        homeQ3          (nullable:true)
        homeQ4          (nullable:true)
        homeOt          (nullable:true)
        guestScore      (nullable:true)
        guestQ1         (nullable:true)
        guestQ2         (nullable:true)
        guestQ3         (nullable:true)
        guestQ4         (nullable:true)
        guestOt         (nullable:true)
    }

    String toString() {
        return homeTeamName + " vs. " + guestTeamName + " (" + DateFormat.getDateInstance().format(date) + ")"
    }
}
