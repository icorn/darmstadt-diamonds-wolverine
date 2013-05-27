package dd.project.wolverine

class Story {

    String  headline
    Date    date
    String  text
    String  newsImageFile
    String  otherImageFile
	News    news

    static mapping = {
        sort "date"
        order "desc"
        version false
    }

    static constraints = {
        otherImageFile  (nullable:true)
	    news            (nullable:true)
    }
}
