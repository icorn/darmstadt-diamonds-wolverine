package dd.project.wolverine

class GameCategory {

    String  nameGerman
    String  nameEnglish

    static mapping = {
        id column : 'game_category_id'
        version false
    }

    static constraints = {
        nameGerman  (nullable:true)
        nameEnglish (nullable:true)
    }

    String toString() {
        return nameGerman
    }
}
