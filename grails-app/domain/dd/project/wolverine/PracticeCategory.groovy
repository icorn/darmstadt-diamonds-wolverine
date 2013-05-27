package dd.project.wolverine

class PracticeCategory {

    String  nameGerman
    String  nameEnglish

    static mapping = {
        version false
    }

    static constraints = {
        nameGerman (nullable:true, blank:true)
        nameEnglish (nullable:true, blank:true)
    }
}
