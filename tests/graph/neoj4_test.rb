
#ruby
# -*- encoding: UTF-8 -*-

require 'logger'
require '../../lib/utils/log.rb'
LOGFILE='../../var/log/log'

require '../../lib/utils/tests.rb'
require '../../lib/graph/neo4j.rb'


class Neo4j_TEST < Test::Unit::TestCase
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
		@neo4j = Neo4j.new @log
	end
	
=begin
	must "configure" do
		Log::method_start "#{self.class}::#{__method__}", @log
		@neo4j.configure
		Log::method_start "#{self.class}::#{__method__}", @log
	end
=end
=begin
	must "sample1" do
		Log::method_start "#{self.class}::#{__method__}", @log
		@neo4j.sample1
		Log::method_start "#{self.class}::#{__method__}", @log
	end
=end
=begin
	must "sample2" do
		Log::method_start "#{self.class}::#{__method__}", @log
		@neo4j.sample2
		Log::method_start "#{self.class}::#{__method__}", @log		
	end
=end
=begin
	must "sample3" do
		Log::method_start "#{self.class}::#{__method__}", @log
		@neo4j.sample3
		Log::method_start "#{self.class}::#{__method__}", @log		
	end
=end
=begin
	must "sample4" do
		Log::method_start "#{self.class}::#{__method__}", @log
		@neo4j.sample4
		Log::method_start "#{self.class}::#{__method__}", @log		
	end
=end
=begin
	must "sample5" do
		Log::method_start "#{self.class}::#{__method__}", @log
		@neo4j.sample5
		Log::method_start "#{self.class}::#{__method__}", @log		
	end
=end
	must "sample6" do
		Log::method_start "#{self.class}::#{__method__}", @log
		@neo4j.sample6
		Log::method_start "#{self.class}::#{__method__}", @log		
	end
end