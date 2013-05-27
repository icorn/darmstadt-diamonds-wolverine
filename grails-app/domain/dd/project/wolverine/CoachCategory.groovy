package dd.project.wolverine

class CoachCategory {

    String  nameGerman
    String  nameEnglish

    static mapping = {
        id column : 'coach_category_id'
        version false
    }

    static constraints = {
        nameEnglish (nullable:true)
    }

    String toString() {
        return nameGerman
    }
}
