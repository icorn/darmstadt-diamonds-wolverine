package dd.project.wolverine

class Coach {

    String  firstname
    String  lastname
    String  image
    String  email
    String  text
	String  shorttext

	// transient:
	String	showEmail

    static mapping = {
        sort "lastname"
        version false
    }

	static transients = ['showEmail']

    static constraints = {
        image   (nullable:true)
        email   (nullable:true)
        text    (nullable:true)
        firstname   (blank:false)
        lastname    (blank:false)
	    shorttext (nullable: false, blank: true)
    }

    static hasMany = [
        seasons : CoachSeason
    ]

    String toString() {
        return firstname + " " + lastname
    }
}
