
#ruby
# -*- encoding: UTF-8 -*-

require 'logger'
require '../../lib/utils/log.rb'
LOGFILE='../../var/log/log'

require '../../lib/utils/tests.rb'
require '../../lib/utils/getconf.rb'


class Getconf_TEST < Test::Unit::TestCase
	class << self
		def startup
			puts File.basename(__FILE__).to_s + " start."
			@log = Logger.new LOGFILE
			@log.info ""
			@log.info File.basename(__FILE__).to_s + " start."
			@log.info ""
		
		end
		def shutdown
			@log.info File.basename(__FILE__).to_s + " finished."
			puts File.basename(__FILE__).to_s + " finished."
		end
	end
	
	def setup
		@log = Logger.new LOGFILE
	end
	
	
	must "get graph.conf" do
		Log::method_start "#{self.class}::#{__method__}", @log
		conf = Getconf::getconf 'graph.conf', @log
		
		assert_equal 'localhost', conf['neo4j']['server']
		assert_equal 7474, conf['neo4j']['port']
		
		Log::method_start "#{self.class}::#{__method__}", @log
	end
	
end