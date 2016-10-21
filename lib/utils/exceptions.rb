
#ruby
require "logger"
def write_error_to_log(error, logger)
	puts error.backtrace
	puts error.message
	logger.fatal( "#{error.backtrace}" )
	logger.fatal( "#{error.message}" )
end