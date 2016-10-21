
#ruby
# -*- encoding: UTF-8 -*-
require 'logger'

require '../../lib/utils/tests.rb'
require '../../lib/pdf/pdf.rb'

LOGFILE='../../var/log/log'

class PDF_TEST < Test::Unit::TestCase
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

=begin
	must "startup, setup, shutdown" do
		method_start __method__, @log
		
		method_finished __method__, @log
	end
=end
	
	must "read sample1.pdf" do
		method_start __method__, @log
		pdf = PDF::read_pdf '../../tests/pdf/sample/Performance evaluation of video streaming using MPEG DASH, RTSP, and RTMP in mobile networks.pdf'
		
		method_finished __method__, @log	
	end

end
