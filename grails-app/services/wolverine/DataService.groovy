package wolverine

import dd.project.wolverine.LeagueTable
import dd.project.wolverine.Result
import dd.project.wolverine.constants.Const


class DataService {

    public static List<LeagueTable> getLeagueTable(servletContext)
    {
	    return LeagueTable.findAllBySeason(((dd.project.wolverine.System)servletContext.getAttribute(Const.SYSTEM))?.currentYear?.intValue(), [sort: "position", order: "asc"])
    }

	public static List<Result> getResults(servletContext)
	{
		def crit = Result.createCriteria()

		def resultInstanceList = crit.list {
			and {
				order('league', 'asc')
				order('date', 'asc')
			}
		}

		return resultInstanceList; // Result.findAll([sort: "id", order: "asc"])
	}
}
