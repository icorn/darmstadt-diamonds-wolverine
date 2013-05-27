package dd.project.wolverine

class Practice {

    PracticeCategory    category
    String              comment
    Integer             day
    String              starttime
    String              endtime
    HomeStadium         facility
    String              facilityName
	String              completeDate

	static transients = ['completeDate']

    static mapping = {
        version false
    }

    static constraints = {
        category        (nullable:false)
        comment         (nullable:true, blank:true)
        day             (nullable:false)
        starttime       (nullable:false, blank:false)
        endtime         (nullable:true, blank:true)
        facility        (nullable:true)
        facilityName    (nullable:false, blank:false)
    }
}
