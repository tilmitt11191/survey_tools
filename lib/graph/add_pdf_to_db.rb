
#ruby
# -*- encoding: UTF-8 -*-

#ARGV[0]: pdf file name

require 'logger'
require '../../lib/utils/exceptions.rb'
require '../../lib/pdf/pdf.rb'

#opt parse -t --title

FILENAME=$0

begin
	puts File.basename(__FILE__).to_s + " start."
	@log = Logger.new("../../var/log/log")
	@log.info ""
	@log.info File.basename(__FILE__).to_s + " start."
	@log.info ""
	
	
	pdf = PDF::read_pdf FILENAME
	puts pdf
	
	#pdf.title.add_to_db
	#pdf.author.add_to_db
	#pdf.text.add_to_db
	
rescue => e
	write_error_to_log(e,@log)
end


@log.info File.basename(__FILE__).to_s + " finished."
puts File.basename(__FILE__).to_s + " finished."
