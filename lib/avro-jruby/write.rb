# Need these for all writes
java_import 'org.apache.avro.Schema'
java_import 'org.apache.avro.generic.GenericDatumWriter'
java_import 'org.apache.avro.file.DataFileWriter'
java_import 'org.apache.avro.generic.GenericData'
java_import 'org.apache.avro.util.Utf8'

module AvroJruby
  module Write
    autoload :AbstractAvroWriter, 'avro-jruby/write/base'
    autoload :AvroFileWriter,     'avro-jruby/write/filewriter'
    autoload :AvroStdoutWriter,   'avro-jruby/write/stdoutwriter'
    autoload :AvroHdfsWriter,     'avro-jruby/write/hdfswriter'
  end
end
