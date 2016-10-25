
#ruby
# -*- encoding: UTF-8 -*-

require '../../lib/utils/tests.rb'
require '../../lib/utils/log.rb'
require '../../lib/web/web.rb'
require '../../lib/web/ieeexplore.rb'

LOGFILE='../../var/log/log'

class IEEEXplore_TEST < Test::Unit::TestCase
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
	
	must "get toppage src of ieeexplore" do
		Log::method_start __method__, @log
		
		site = IEEEXplore.new @log
		page = site.get_toppage html_output_filename='../../tests/workspace/output/ieee_top.html'
		
		Log::method_finished __method__, @log	
	end
	
end