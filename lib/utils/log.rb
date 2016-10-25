
#ruby
# -*- encoding: UTF-8 -*-

require 'logger'

class Log
		
		def self.method_start name, log
			puts "#{name} start."
			log.info "#{name} start."
		end

		def self.method_finished name, log
			puts "#{name} finished."
			log.info "#{name} finished."
		end

end