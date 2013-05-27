package dd.project.wolverine

class Team {

    String      name
    String      nickname
    String      city
    String      unused
    String      logoFile
    String      history
    String      website
    String      directions
    String      stadium

    static mapping = {
        nickname      column : 'short_name'
        city          column : 'old_name1'
        unused        column : 'old_name2'

        sort "name"
        version false
    }

    static constraints = {
        unused      (nullable:true)
        logoFile    (nullable:true)
        history     (nullable:true)
        website     (nullable:true)
        directions  (nullable:true)
        stadium     (nullable:true)

        name        (blank:false)
        nickname    (blank:false)
        city        (blank:false)
    }

    String toString() {
        return name
    }
}
