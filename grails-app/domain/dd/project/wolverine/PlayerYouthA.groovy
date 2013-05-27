package dd.project.wolverine

class PlayerYouthA {

    String      firstname
    String      lastname
    String      position
    Integer     number
    String      image

    static mapping = {
        sort "lastname"
        version false
    }

    static constraints = {
        firstname   (nullable:true, blank:false)
        lastname    (nullable:true, blank:false)
        position    (nullable:true)
        number      (nullable:true)
        image       (nullable:true)
    }

    String toString() {
        return firstname + " " + lastname
    }

}
