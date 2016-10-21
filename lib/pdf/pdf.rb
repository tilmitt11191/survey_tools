
#ruby
# -*- encoding: UTF-8 -*-

require 'poppler'

class PDF
	
	@filename
	@title
	@author
	@text
	
	def initialize filename
		@filename = filename
	end
	
	def self.read_pdf filename
		pdf = document = Poppler::Document.new filename
		puts pdf
		#puts pdf[0].get_text
		#puts pdf.count

		#pdf.each do |page|
 		 #puts page.get_text
		#end
		pdf
	end
	
	def to_s
		puts 'to_s'
	end

end