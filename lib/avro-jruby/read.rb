# need all these for reads
java_import 'org.apache.avro.generic.GenericDatumReader'
java_import 'org.apache.avro.file.DataFileReader'
# java_import 'org.apache.avro.io.BinaryEncoder'
# java_import 'org.apache.avro.generic.GenericData'
# java_import 'org.apache.avro.util.Utf8'

module AvroJruby
  module Read
    autoload :AbstractAvroReader, 'avro-jruby/read/base'
    autoload :AvroFileReader,     'avro-jruby/read/filereader'
    autoload :AvroHdfsReader,     'avro-jruby/read/hdfsreader'
  end
end
