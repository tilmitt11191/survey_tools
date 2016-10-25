
#ruby
# -*- encoding: UTF-8 -*-

require '../../lib/utils/tests.rb'
require '../../lib/utils/log.rb'
require '../../lib/web/web.rb'
require '../../lib/web/ieeexplore.rb'
require '../../lib/pdf/pdf.rb'

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
		@site = IEEEXplore.new @log
	end

=begin	
	must "get toppage src of ieeexplore" do
		Log::method_start "#{self.class}::#{__method__}", @log
		
		page = @site.get_toppage html_output_filename='../../tests/workspace/output/ieee_top.html'
		
		Log::method_finished "#{self.class}::#{__method__}", @log	
	end
=end
	must "get searched page src of sample2" do
		Log::method_start "#{self.class}::#{__method__}", @log
		#pdf = PDF.new '../../tests/pdf/sample/sample2.pdf', @log
		#title = 'FDASH: A Fuzzy-Based MPEG/DASH Adaptation Algorithm'
		title = 'sample2'
		@site.get_toppage
		@site.get_searched_page_of 'sample2.pdf', html_output_filename="../../tests/workspace/output/#{title}.html"
		
	
		Log::method_finished "#{self.class}::#{__method__}", @log	
	end
	
	must "get searched page src of FDASH" do
		Log::method_start "#{self.class}::#{__method__}", @log
		#pdf = PDF.new '../../tests/pdf/sample/sample2.pdf', @log
		#title = 'FDASH: A Fuzzy-Based MPEG/DASH Adaptation Algorithm'
		title = 'FDASH'
		@site.get_toppage
		@site.get_searched_page_of 'FDASH: A Fuzzy-Based MPEG/DASH Adaptation Algorithm', html_output_filename="../../tests/workspace/output/#{title}.html"
		
	
		Log::method_finished "#{self.class}::#{__method__}", @log	
	end
	
end