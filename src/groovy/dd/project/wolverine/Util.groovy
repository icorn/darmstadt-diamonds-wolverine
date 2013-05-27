/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dd.project.wolverine

/**
 *
 * @author oli
 */
class Util {

	/**
	 * Converts a given date (and time) to a nice string for JSON.
	 *
	 * @param date      the date object to be converted. Cannot be null.
	 * @param time      the time as string in format <hh>:<mm>. If null, the time form the date-object is used.
	 *
	 * @return          a string with the date in format <YYYY>-<MM>-<DD>T<hh>:<mm>:<ss>Z or null
	 */
	static String dateToJsonString(date, time=null)
	{
		def dateString = null

		if (date)
		{
			// generate date-part of string

			def cal = new GregorianCalendar()
			cal.setTime(date)

			def month = cal.get(Calendar.MONTH) + 1
			def monthString = (month < 10) ? ("0" + Integer.toString(month)) : Integer.toString(month)

			def day = cal.get(Calendar.DATE)
			def dayString = (day < 10) ? ("0" + Integer.toString(day)) : Integer.toString(day)

			// generate time-part of string

			def timeString

			if (time)
				timeString = time + ":00Z"
			else
			{
				def hour = cal.get(Calendar.HOUR_OF_DAY)
				def hourString = (hour < 10) ? ("0" + Integer.toString(hour)) : Integer.toString(hour)

				def minute = cal.get(Calendar.MINUTE)
				def minuteString = (minute < 10) ? ("0" + Integer.toString(minute)) : Integer.toString(minute)

				timeString = hourString + ":" + minuteString + ":00Z"
			}

			// put together both strings

			dateString = Integer.toString(cal.get(Calendar.YEAR)) + "-" + monthString + "-" + dayString + "T" + timeString
		}

		return dateString;
	}

}
