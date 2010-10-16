#
# Write avro to output stream (file, hdfs file, or stdout)
#
java_import 'org.apache.avro.Schema'
java_import 'org.apache.avro.generic.GenericDatumWriter'
java_import 'org.apache.avro.file.DataFileWriter'
java_import 'org.apache.avro.generic.GenericData'
java_import 'org.apache.avro.util.Utf8'

# get schema
# feed schema to java avro libs
# point java to source data
# java dumps source data to iostream of my choosing

# schema_str = "{
#       \"namespace\": \"test.avro\",
#       \"name\": \"FacebookUser\",
#       \"type\": \"record\",
#       \"fields\": [
#           {\"name\": \"name\", \"type\": \"string\"},
#           {\"name\": \"num_likes\", \"type\": \"string\"},
#           {\"name\": \"num_photos\", \"type\": \"string\"},
#           {\"name\": \"num_groups\", \"type\": \"string\"} ]
# }"


#
# Designed to open a stream and write one record at a time to it
#
module AvroJruby
  class AbstractAvroWriter
    attr_writer :schema, :fout, :writer, :file_writer
    
    #
    # Expects a json string for the schema
    #
    def initialize schema, outpath
      @schema      = Schema.parse(schema)
      @fout        = java.io.File.new(outpath)
      @writer      = GenericDatumWriter.new(@schema)
      @file_writer = DataFileWriter.new(@writer)
      @file_writer.create(@schema, @fout)
    end

    #
    # Takes a hash and stuffs into into the output stream as avro
    #
    def write record
      datum = GenericData::Record.new(@schema)
      record.each do |k,v|
        datum.put(k.to_s, v)
      end
      @file_writer.append(datum)
    end

    #
    # Close output stream
    #
    def close
      @file_writer.close
    end
    
  end

  class AvroFileWriter < AbstractAvroWriter
  end

  class AvroStdoutWriter < AbstractAvroWriter
  end

  class AvroHdfsWriter < AbstractAvroWriter
  end
  
end
