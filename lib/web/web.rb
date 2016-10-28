
#ruby
# -*- encoding: UTF-8 -*-

require '../../lib/utils/log.rb'
require 'net/http'
require 'open-uri'
require 'nokogiri'
require "mechanize"
require 'watir-webdriver'

class Web
	@html_row_data
	@page_cache #Hash key:url value:Mechanize
	@html_cache #Hash key:url value:html_row_data
	@dom
	#attr_accessor :dom, :page_cache

	def initialize
		@page_cache = {}
		@html_cache = {}
	end
	
	def self.url_exists?(url, log, limit = 2)
		log.info "#{"#{self.class}::#{__method__}"}(#{url}, limit = #{limit}) start."
		if limit == 0
			log.info "#{"#{self.class}::#{__method__}"} finished. url[#{url}] does not exist."
			return false
		end
		begin
			response = Net::HTTP.get_response(URI.parse(url))
		rescue
			log.info "#{"#{self.class}::#{__method__}"} finished. url[#{url}] does not exist."
			return false
		else
			case response
			when Net::HTTPSuccess
				log.info "#{"#{self.class}::#{__method__}"} finished. url[#{url}] exists."
				return true
			when Net::HTTPRedirection
				url_exists?(response['location'], log, limit - 1)
			else
				log.info "#{"#{self.class}::#{__method__}"} finished. url[#{url}] does not exist."
				return false
			end
		end
	end
	
	def get url, log
		Log::method_start "#{self.class}::#{__method__}", log
		if !@page_cache[url].nil? then
			log.debug "url[#{url}] page_cached. return cached Mechanize page. the title of url[#{url}] is [#{@page_cache[url].title}]."
			return @page_cache[url]
		end
		
		agent = Mechanize.new
		page = agent.get(url)
		@page_cache[url] = page
		log.debug "url[#{url}] page not cached. return Mechanize page and cache [#{@page_cache[url].title}]."
		Log::method_finished "#{self.class}::#{__method__}", log
		return page
	end
	
	def get_dom_of url, log
		log.info "web.#{"#{self.class}::#{__method__}"}(#{url}) start."
		if !@html_cache[url].nil? then
			log.info "url[#{url}] html_cached. return html_cached dom. the title of url[#{url}] is [#{@dom.title}]."
			@dom = @html_cache[url]
			return @dom
		end
		
		if !Web::url_exists? url, log then
			log.info "url[#{url}] not exist. return false."
			return nil
		end		

		# Request the HTML before parsing
		@html_row_data = open(url).read
		# Replace original DOCTYPE with a valid DOCTYPE
		@html_row_data = @html_row_data.sub(/^<!DOCTYPE html(.*)$/, '<!DOCTYPE html>')
		# Parse
		@dom = Nokogiri::HTML(@html_row_data)
		
		@html_cache[url] = @dom
		log.info "return dom. the title of url[#{url}] is [#{@dom.title}]."
		return @dom
	end
	
	def print_html_src log
		Log::method_start "#{self.class}::#{__method__}", log
		puts @html_row_data.to_s.encoding
		puts @html_row_data.to_s
		Log::method_finished "#{self.class}::#{__method__}", log
	end
	
	def output_html_src_to filename, log
		Log::method_start "#{self.class}::#{__method__}", log
		if @html_row_data.nil? then
			log.warn "@html_row_data is nil. return false."
			return false
		end
		file = File.open(filename, "w:utf-8", :invalid => :replace, :undef => :replace, :replace => '?')
		file.puts @html_row_data
		file.close
		#@html_row_data.each do |line|
		#	puts line
		#end
		Log::method_finished "#{self.class}::#{__method__}", log
	end
	
	
	def get_src_from_mechanize page, filename, log
		Log::method_start "#{self.class}::#{__method__}", log
		file = File.open(filename, "w:utf-8", :invalid => :replace, :undef => :replace, :replace => '?')
		file.puts page.body
		file.close
		Log::method_finished "#{self.class}::#{__method__}", log
	end
	
	
	def get_html_from_url url, filename, log
		Log::method_start "#{self.class}::#{__method__}", log
		log.debug "url[#{url}], filename[#{filename}]"

		browser = Watir::Browser.new :ff
		browser.goto url
		
		
		#page = Nokogiri.HTML(open(url))
		#@page_cache[url] = page
		#file = File.open(filename, "w:utf-8", :invalid => :replace, :undef => :replace, :replace => '?')
		#file.puts page.inner_text
		#file.close
		
		

		Log::method_finished "#{self.class}::#{__method__}", log
	end
	
end




