require 'java'
require 'rubygems'
require 'json'

this = File.expand_path(__FILE__)
this = File.expand_path(File.readlink(__FILE__)) if File.symlink?(__FILE__)
avro_jar_dir = File.expand_path(this+'/../../jars')

# Require avro jars
Dir["#{avro_jar_dir}/*.jar"].each{|jar| require jar}

module AvroJruby
  autoload :Write, 'avro-jruby/write'
end

