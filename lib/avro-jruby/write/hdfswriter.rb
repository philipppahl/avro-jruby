module AvroJruby::Write

  #
  # I'll write this someday
  #
  class AvroHdfsWriter < AbstractAvroWriter
    
    def initialize schema
      super(schema)
    end

    def outstream
      @outstream = "FAIL"
    end
  end
end
