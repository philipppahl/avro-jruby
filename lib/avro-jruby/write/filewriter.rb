module AvroJruby::Write
  class AvroFileWriter < AbstractAvroWriter
    attr_writer :outpath
    
    def initialize schema, outpath
      @outpath = outpath
      super(schema)
    end
    
    def outstream
      @outstream ||= java.io.File.new(@outpath)
    end
  end
end
