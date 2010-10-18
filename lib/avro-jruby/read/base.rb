# reader simply opens the stream and returns an iterator to records
module AvroJruby::Read
  class AbstractAvroReader
    attr_writer :reader, :file_reader
    
    def initialize *args
      @reader      = GenericDatumReader.new
      @file_reader = DataFileReader.new(instream, @reader)
    end

    def instream
      raise 'You must define an input stream in subclass'
    end

    #
    # Yield stringified records
    #
    def each &blk
      @file_reader.each do |record|
        yield record.to_s
      end
    end

    def close
      @file_reader.close
    end
    
  end
end
