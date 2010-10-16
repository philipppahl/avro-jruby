#!/usr/bin/env jruby

require 'rubygems'
require 'wukong'
require 'wukong/schema'
$: << '/home/jacob/Programming/avro-jruby/lib'
require 'avro-jruby' ; include AvroJruby::Write

class ComicBook < TypedStruct.new(
    [:title,     String],
    [:year,      String],
    [:condition, String]
    )
end

#
# Write flat wukong typed struct objects to disk as an avro file. This
# should work just as well if you change the writer to stdout writer or
# hdfs writer
#
class AvroStreamer < Wukong::Streamer::StructStreamer

  attr_accessor :schema
  
  def process thing, *_
    @schema ||= thing.class.to_avro
    writer.write(thing.to_hash)
  end

  def writer
    @writer ||= AvroFileWriter.new(@schema, "foo.avro")
  end

  def after_stream
    writer.close
  end
  
end

Wukong::Script.new(AvroStreamer, nil).run
