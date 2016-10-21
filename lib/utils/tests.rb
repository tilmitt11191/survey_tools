
#ruby
# -*- encoding: UTF-8 -*-
require 'test/unit'

module Test::Unit
	class TestCase
	
		def self.must(name, &block)
			test_name = "test_#{name.gsub(/\s+/,"_")}".to_sym
			defined = instance_method(test_name) rescue false
			raise "#{test_name} is already defined in #{self}" if defined
			if block_given?
				define_method(test_name, &block)
			else
				define_method(test_name) do
					flunk "No implementation provided for #{name}"
				end
			end
		end
		
		def method_start name, log
			puts "#{name} start."
			log.info "#{name} start."
		end

		def method_finished name, log
			puts "#{name} finished."
			log.info "#{name} finished."
		end
	end
end