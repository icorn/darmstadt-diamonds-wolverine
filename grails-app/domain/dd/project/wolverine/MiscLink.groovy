package dd.project.wolverine

class MiscLink {

    String  url
    String  name

    static mapping = {
        sort "name"
        version false
    }

    static constraints = {
    }

    String toString() {
        return name
    }
}
