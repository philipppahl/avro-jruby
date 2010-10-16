module AvroJruby::Write
  class AvroStdoutWriter < AbstractAvroWriter
    #
    # Be vrrrry careful
    #
    def outstream
      @outstream ||= java.lang.System.out
    end
  end
end
