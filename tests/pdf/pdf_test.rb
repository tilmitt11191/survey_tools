
#ruby
# -*- encoding: UTF-8 -*-

require '../../lib/utils/tests.rb'
require '../../lib/utils/log.rb'
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
		Log::method_start "#{self.class}::#{__method__}", @log
		
		Log::method_finished "#{self.class}::#{__method__}", @log
	end
#=end
#=begin
	must "read sample1.pdf" do
		Log::method_start "#{self.class}::#{__method__}", @log
		pdf = PDF.new '../../tests/pdf/sample/sample1.pdf', @log
		
		Log::method_finished "#{self.class}::#{__method__}", @log	
	end
#=end
#=begin
	must "get title of sample1.pdf" do
		Log::method_start "#{self.class}::#{__method__}", @log
		pdf = PDF.new '../../tests/pdf/sample/sample1.pdf', @log
		assert_equal 'Performance Evaluation of Video Streaming Using MPEG DASH, RTSP, and RTMP in Mobile Networks', pdf.title
		Log::method_finished "#{self.class}::#{__method__}", @log
	end
=end
#=begin
	must "get title of sample2.pdf" do
		Log::method_start "#{self.class}::#{__method__}", @log
		pdf = PDF.new '../../tests/pdf/sample/FDASH A Fuzzy-Based MPEGDASHAdaptation Algorithm.pdf', @log
		assert_equal 'FDASH: A Fuzzy-Based MPEG/DAS Adaptation Algorithm', pdf.title
		Log::method_finished "#{self.class}::#{__method__}", @log
	end
#=end
=begin
	must "get title of sample3.pdf" do
		Log::method_start "#{self.class}::#{__method__}", @log
		pdf = PDF.new '../../tests/pdf/sample/sample3.pdf', @log
		assert_equal 'FDASH: A Fuzzy-Based MPEG/DAS Adaptation Algorithm', pdf.title
		Log::method_finished "#{self.class}::#{__method__}", @log
	end
#=end
#=begin
	must "get author of sample1.pdf" do
		Log::method_start "#{self.class}::#{__method__}", @log
		pdf = PDF.new '../../tests/pdf/sample/sample1.pdf', @log
		assert_equal 'A.Aloman', pdf.authors[0]
		assert_equal 'A.I.Ispas', pdf.authors[1]
		assert_equal 'P.Ciotirnae', pdf.authors[2]
		assert_equal 'R.Sanchez-Iborra', pdf.authors[3]
		assert_equal 'M.D.Cano', pdf.authors[4]
		assert_equal nil, pdf.authors[5]
		Log::method_finished "#{self.class}::#{__method__}", @log
	end
=end
#=begin
	must "get author of sample2.pdf" do
		Log::method_start "#{self.class}::#{__method__}", @log
		pdf = PDF.new '../../tests/pdf/sample/sample2.pdf', @log
		assert_equal 'Dimitrios J.Vergados', pdf.authors[0]
		assert_equal 'AngelosMichalas', pdf.authors[1]
		assert_equal 'AggelikiSgora', pdf.authors[2]
		assert_equal 'DimitriosD.Vergados', pdf.authors[3]
		assert_equal 'PeriklisChatzimisios', pdf.authors[4]
		Log::method_finished "#{self.class}::#{__method__}", @log
	end
#=end
=begin
	must "add_to_db of sample1.pdf" do
		Log::method_start "#{self.class}::#{__method__}", @log
		pdf = PDF.new '../../tests/pdf/sample/sample1.pdf', @log
		pdf.add_to_db
		
		Log::method_finished "#{self.class}::#{__method__}", @log
	end
=end
end
