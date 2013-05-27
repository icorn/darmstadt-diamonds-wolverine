package dd.project.wolverine

class Player {

    String      firstname
    String      lastname
    String      nickname
    Date        dateOfBirth
    String      position
    Integer     number
    Integer     height
    Integer     weight
    String      image

    static mapping = {
        sort "number"
        version false
    }

    static hasMany = [
        seasons : PlayerSeason,
        scores  : Score
    ]

    static constraints = {
        nickname    (nullable:true)
        dateOfBirth (nullable:true)
        position    (nullable:true)
        number      (nullable:true)
        height      (nullable:true)
        weight      (nullable:true)
        image       (nullable:true)

        firstname   (blank:false)
        lastname    (blank:false)
    }

    String toString() {
        return firstname + " " + lastname
    }

}
