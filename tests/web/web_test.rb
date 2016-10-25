
#ruby
# -*- encoding: UTF-8 -*-

require '../../lib/utils/tests.rb'
require '../../lib/utils/log.rb'
require '../../lib/web/web.rb'

LOGFILE='../../var/log/log'

class Web_TEST < Test::Unit::TestCase
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
		@web = Web.new
	end

=begin
	must "get http://ieeexplore.ieee.org/Xplore/home.jsp" do
		Log::method_start "#{self.class}::#{__method__}", @log
		
		page = @web.get 'http://ieeexplore.ieee.org/Xplore/home.jsp', @log
		assert_equal 'IEEE Xplore Digital Library', page.title
		
		Log::method_finished "#{self.class}::#{__method__}", @log	
	end
=end
=begin
	must "get src from mechanize" do
		page = @web.get 'http://ieeexplore.ieee.org/Xplore/home.jsp', @log
		@web.get_src_from_mechanize page, '../../tests/workspace/output/ieeexplore_home.html', @log
	end
=end

	must "get html from url FDASH" do
		url = 'http://ieeexplore.ieee.org/search/searchresult.jsp?newsearch=true&queryText=FDASH:%20A%20Fuzzy-Based%20MPEG%2FDASH%20Adaptation%20Algorithm'
		@web.get_html_from_url url, '../../tests/workspace/output/FDASH_URL.html', @log
	end
end