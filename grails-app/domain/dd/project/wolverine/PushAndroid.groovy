package dd.project.wolverine

class PushAndroid {

	String  deviceId
	Boolean pushScores  = false
	Boolean pushFinal   = false
	Boolean pushNews    = false
	Long    failCounter = 0
	Date    createTime  = new Date()
	Date    updateTime  = null

	static constraints =
	{
		deviceId    (nullable: false)
		pushScores  (nullable: false)
		pushFinal   (nullable: false)
		pushNews    (nullable: false)
		failCounter (nullable: false)
		createTime  (nullable: false)
		updateTime  (nullable: true)
	}

	static mapping = {
		version false
	}

	String toString()
	{
		return deviceId
	}


}
