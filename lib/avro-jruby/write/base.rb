module AvroJruby::Write
  class AbstractAvroWriter
    attr_writer :schema, :writer, :file_writer
    
    #
    # Expects a json string for the schema
    #
    def initialize schema
      @schema      = Schema.parse(schema)
      @writer      = GenericDatumWriter.new(@schema)
      @file_writer = DataFileWriter.new(@writer)
      @file_writer.create(@schema, outstream)
    end

    def outstream
      raise 'You must define output stream in subclass'
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
end
