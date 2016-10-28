
#ruby
# -*- encoding: UTF-8 -*-

require 'logger'
require '../../lib/utils/log.rb'

require 'yaml'
CONF_PATH='../../etc/'

module Getconf

	def self.getconf conf_filename, log
		Log::method_start "#{self.class}::#{__method__}", log
		full_filename = "#{CONF_PATH}#{conf_filename}"
		log.debug "read #{full_filename}"
		conf = YAML.load_file(full_filename)
		Log::method_finished "#{self.class}::#{__method__}", log
		log.debug "return #{conf}"
		conf
	end
end