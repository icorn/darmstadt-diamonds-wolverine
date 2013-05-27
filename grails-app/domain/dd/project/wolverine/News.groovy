package dd.project.wolverine

class News {

    Date        date
    String      headline
    String      text
    Integer     hide
    Game        linkGame
    GameYouthA  linkYouthAGame
    Story       linkStory
    String      linkStoryTitle
    Event       linkEvent
    String      linkEventTitle
    MiscLink    linkMisc
    String      linkMiscTitle
    String      linkExtern
    String      linkExternTitle
    String      imageFile
    String      eventImagesDir
    String      imageHeaderFile

    NewsCategory    category

    static mapping = {
        linkYouthAGame column : 'link_youth_a_game_id'
        version false
    }

    static constraints = {
        date            (nullable:true)
        headline        (nullable:false, blank:false)
        text            (nullable:false, blank:false)
        hide            (nullable:false)
        linkGame        (nullable:true)
        linkYouthAGame  (nullable:true)
        linkStory       (nullable:true)
        linkStoryTitle  (nullable:true, blank:true)
        linkEvent       (nullable:true)
        linkEventTitle  (nullable:true, blank:true)
        linkMisc        (nullable:true)
        linkMiscTitle   (nullable:true, blank:true)
        linkExtern      (nullable:true)
        linkExternTitle (nullable:true, blank:true)
        imageFile       (nullable:true, blank:true)
        eventImagesDir  (nullable:false, blank:true)
        category        (nullable:false)
        imageHeaderFile (nullable:true, blank:true)
    }
}
