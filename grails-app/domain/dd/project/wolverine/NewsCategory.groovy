package dd.project.wolverine

class NewsCategory {

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
