import dd.project.wolverine.constants.Const
import org.codehaus.groovy.grails.commons.ApplicationAttributes
import org.codehaus.groovy.grails.web.mapping.LinkGenerator;

class BootStrap {

    def init = { servletContext ->

	    // fixes the database problems.
	    // from: http://sacharya.com/grails-dbcp-stale-connections/

	    // First get the dataSource object
	    def ctx=servletContext.getAttribute(ApplicationAttributes.APPLICATION_CONTEXT)
	    def dataSource = ctx.dataSourceUnproxied

	    // Now lets run the evictor (deleter) every 2 minutes and evict any connections older than 2 minutes.
	    dataSource.setMinEvictableIdleTimeMillis(1000 * 60 * 2)
	    dataSource.setTimeBetweenEvictionRunsMillis(1000 * 60 * 2)
	    dataSource.setNumTestsPerEvictionRun(3)

	    dataSource.setTestOnBorrow(true)
	    dataSource.setTestWhileIdle(false)
	    dataSource.setTestOnReturn(false)
	    dataSource.setValidationQuery("SELECT '*' FROM system")

	    dataSource.properties.each { println it }

	    // select the system table and store it in the servlet-context
	    servletContext.setProperty(Const.SYSTEM, dd.project.wolverine.System.get(1))

	    // generate a Random-object and store it in the servlet-context
	    servletContext.setProperty(Const.RANDOM, new java.util.Random())


/*
//          Settings from HKD

			properties {
				// The maximum number of active connections that can be allocated from this pool at the same time, or negative for no limit.
				maxActive = 100
				// The maximum number of connections that can remain idle in the pool, without extra ones being released, or negative for no limit.
				maxIdle = 4
				// The minimum number of connections that can remain idle in the pool, without extra ones being created, or zero to create none.
				minIdle = 2
				// The initial number of connections that are created when the pool is started.
				initialSize = 3
				// The minimum amount of time an object may sit idle in the pool before it is eligable for eviction by the idle object evictor (if any).
				minEvictableIdleTimeMillis = 1000 * 60 * 30
				// The number of milliseconds to sleep between runs of the idle object evictor thread. When non-positive, no idle object evictor thread will be run.
				timeBetweenEvictionRunsMillis = 30000
				// The maximum number of milliseconds that the pool will wait (when there are no available connections) for a connection to be returned before throwing an exception, or -1 to wait indefinitely.
				maxWait = 5000
				// Query that must return at least one row
				validationQuery = "select '*' from system"
				// Validated before being borrowed from the pool
				testOnBorrow = true
				// The indication of whether objects will be validated by the idle object evictor (if any).
				testWhileIdle = true
			}
*/

    }

    def destroy = {
    }
}
