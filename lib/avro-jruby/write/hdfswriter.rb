java_import 'org.apache.hadoop.conf.Configuration'
java_import 'org.apache.hadoop.fs.FileSystem'
java_import 'org.apache.hadoop.fs.Path'
java_import 'org.apache.hadoop.fs.permission.FsPermission'

$CLASSPATH << ENV['HADOOP_HOME']+'/conf'

module AvroJruby::Write

  class AvroHdfsWriter < AbstractAvroWriter
    attr_writer :config, :hdfs, :hdfspath
    
    def initialize schema, hdfspath
      @config   = org.apache.hadoop.conf.Configuration.new
      @hdfs     = org.apache.hadoop.fs.FileSystem.get(@config)
      @hdfspath = org.apache.hadoop.fs.Path.new(hdfspath)
      super(schema)
    end

    #
    # Caution! right now this will overwrite what's there
    #
    def outstream
      @outstream ||= org.apache.hadoop.fs.FileSystem.create(@hdfs, @hdfspath, FsPermission.new(0644))
    end
    
  end
end
