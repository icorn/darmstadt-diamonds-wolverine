class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/" {
            controller = "news"
            action = "list"
        }

/*
        "/"(view:"/index")
*/
		"500"(view:'/error')
	}
}
