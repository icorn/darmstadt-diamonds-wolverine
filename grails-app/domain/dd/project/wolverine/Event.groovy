package dd.project.wolverine

class Event {

    Date        date
    String      title
    Story       story
    Game        game
    GameYouthA  gameYouthA
    String      time
    String      location
    HomeStadium stadium
    String      text
    String      linkUrl

    static mapping = {
        gameYouthA column : 'game_youth_a_id'
        version false
    }

    static constraints = {
        date        (nullable:false)
        title       (nullable:true, blank:true)
        story       (nullable:true)
        game        (nullable:true)
        gameYouthA  (nullable:true)
        time        (nullable:true, blank:true)
        location    (nullable:true, blank:true)
        stadium     (nullable:true)
        text        (nullable:true, blank:true)
        linkUrl     (nullable:true, blank:true)
    }
}
