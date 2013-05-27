package dd.project.wolverine

class System {

    Integer     featuredGame
    Integer     currentYear

	String      absPathNewsImages
	String      absPathNewsHeaderImages
	String      absPathMenuBannerImages
	String      absPathCoachesImages
	String      absPathPlayersImages
	String      absPathYouthaImages
	String      absPathTeamLogos
	String      absPathTeamLogosBig
	String      absPathStadiumsImages
	String      absPathPressImages
	String      absPathPartnerLogos
	String      absPathAmazonImages
	String      absPathTeamzone
	String      absPathStats
	String      absPathUnknownPlayerImage
	String      absPathInfoBanner
	String      absPathGameImages
	String      absPathPdfFiles
	String      absPathManagementImages

	String      jsonUrl
	String      jsonUrlTable
	String      jsonUrlNewslist
	String      jsonUrlNewsitem
	String      jsonUrlStory
	String      jsonUrlSchedule
	String      jsonUrlRoster
	String      jsonUrlGame
	String      jsonUrlPractice

    static mapping = {
        version false

//        features_game_id column : 'featured_game'
    }

    static constraints = {
        featuredGame        (nullable:false)
        currentYear         (nullable:false)

	    absPathNewsImages           (nullable:false, blank:true)
	    absPathNewsHeaderImages     (nullable:false, blank:true)
	    absPathMenuBannerImages     (nullable:false, blank:true)
	    absPathCoachesImages        (nullable:false, blank:true)
	    absPathPlayersImages        (nullable:false, blank:true)
	    absPathYouthaImages         (nullable:false, blank:true)
	    absPathTeamLogos            (nullable:false, blank:true)
	    absPathTeamLogosBig         (nullable:false, blank:true)
	    absPathStadiumsImages       (nullable:false, blank:true)
	    absPathPressImages          (nullable:false, blank:true)
	    absPathPartnerLogos         (nullable:false, blank:true)
	    absPathAmazonImages         (nullable:false, blank:true)
	    absPathTeamzone             (nullable:false, blank:true)
	    absPathStats                (nullable:false, blank:true)
	    absPathUnknownPlayerImage   (nullable:false, blank:true)
	    absPathInfoBanner           (nullable:false, blank:true)
	    absPathGameImages           (nullable:false, blank:true)
	    absPathPdfFiles             (nullable:false, blank:true)
	    absPathManagementImages     (nullable:false, blank:true)

	    jsonUrl                     (nullable:false, blank:true)
	    jsonUrlTable                (nullable:false, blank:true)
	    jsonUrlNewslist             (nullable:false, blank:true)
	    jsonUrlNewsitem             (nullable:false, blank:true)
	    jsonUrlStory                (nullable:false, blank:true)
	    jsonUrlSchedule             (nullable:false, blank:true)
	    jsonUrlRoster               (nullable:false, blank:true)
	    jsonUrlGame                 (nullable:false, blank:true)
	    jsonUrlPractice             (nullable:false, blank:true)
    }
}
