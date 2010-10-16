#!/usr/bin/env jruby

$: << '/home/jacob/Programming/avro-jruby/lib' # ...
require 'avro-jruby' ; include AvroJruby::Write

schema_str = "{
      \"namespace\": \"test.avro\",
      \"name\": \"FacebookUser\",
      \"type\": \"record\",
      \"fields\": [
          {\"name\": \"name\", \"type\": \"string\"},
          {\"name\": \"num_likes\", \"type\": \"string\"},
          {\"name\": \"num_photos\", \"type\": \"string\"},
          {\"name\": \"num_groups\", \"type\": \"string\"} ]
}"

record = {
  :name       => "John Jacob Jingleheimer-Schmidt",
  :num_likes  => "500",
  :num_photos => "13",
  :num_groups => "1"
}

writer = AvroFileWriter.new(schema_str, 'foo.avro')
writer.write(record)
writer.close

writer = AvroStdoutWriter.new(schema_str)
writer.write(record)
writer.close
