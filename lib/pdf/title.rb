
#ruby
# -*- encoding: UTF-8 -*-

require '../../lib/utils/log.rb'

class Title

	@title
	@log
	
	def initialize title,log
		@title = title
		@log = log
	end

	def self.title
		Log::method_start __method__, @log
		Log::method_finished __method__, @log
		@title
	end
	
	def to_s
		Log::method_start __method__, @log
		Log::method_finished __method__, @log
		@title.to_s
	end

end