
#ruby
# -*- encoding: UTF-8 -*-

require 'poppler'
require 'active_support/core_ext/object' #for blank?
require '../../lib/utils/log.rb'
require '../../lib/web/ieeexplore.rb'


class PDF
	@log
	
	@full_filename
	@pdf
	
	@title
	@authors
	@date
	@text
	
	attr_accessor :full_filename, :title, :authors, :date, :text

	def initialize filename, log
		@log = log
		@full_filename = filename
		@pdf = Poppler::Document.new @full_filename
		get_attributions_of @pdf
	end
	
	
	def to_s
		puts 'to_s'
	end
	
	
	def get_attributions_of pdf
		Log::method_start "#{self.class}::#{__method__}", @log
		filename = File.basename(@full_filename)
		
		@title = pdf.title
		@authors = get_authors_from pdf
		@log.debug "pdf.title[#{@title}], pdf.authors[#{@authores}]"
		if !@title.blank? && !@authors.blank? then
			return @titile, @authors
		end
		
		@log.debug "pdf.title or pdf.author is blank. get form IEEE Xplore by filename[#{filename}]"
		site = IEEEXplore.new @log
		@title, @authors = site.get_attributions_of filename
		if !@title.blank? && !@authors.blank? then
			return @titile, @authors
		end
		
		@log.debug "pdf.title or pdf.author by IEEEXplore is blank. set  filename manually [#{filename}]"
		
		Log::method_finished "#{self.class}::#{__method__}",@log
	end
	
	
	def get_authors_from pdf
		Log::method_start "#{self.class}::#{__method__}", @log
		puts @pdf.author
		@authors = @pdf.author.gsub(' ','').split(',')
		Log::method_finished "#{self.class}::#{__method__}",@log
		@authors
	end
	
	
	def add_to_db
		Log::method_start "#{self.class}::#{__method__}",@log
		puts "title: #{@title}"
		puts "author: #{@author}"
		puts "date: #{@date}"
		
		Log::method_finished "#{self.class}::#{__method__}",@log
	end
	
	
	def get_full_text
		@pdf.each do |text|
			puts text.get_text
		end
	end

end