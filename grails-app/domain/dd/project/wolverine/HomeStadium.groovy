package dd.project.wolverine

class HomeStadium {

    String  name
    String  address
    String  capacity
//    String  directions
//    String  imageDirections
    String  imageStadium
	String  gmapsEmbed
	String  publicTransport
	String  comment

    static mapping = {
        version false
    }

    static constraints = {
        address         (nullable: true)
        capacity        (nullable: true)
//        directions      (nullable: true)
//        imageDirections (nullable: true)
        imageStadium    (nullable: true)
	    gmapsEmbed      (nullable: true)
	    publicTransport (nullable: true)
	    comment         (nullable: true)
    }

    String toString() {
        return name
    }
}
