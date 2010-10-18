module AvroJruby::Read
  class AvroFileReader < AbstractAvroReader
    attr_writer :inpath
    
    def initialize inpath
      @inpath = inpath
      super
    end
    
    def instream
      @instream ||= java.io.File.new(@inpath)
    end
  end
end
