java_import 'org.apache.hadoop.conf.Configuration'
java_import 'org.apache.hadoop.fs.FileSystem'
java_import 'org.apache.hadoop.fs.Path'
java_import 'org.apache.hadoop.fs.permission.FsPermission'

$CLASSPATH << ENV['HADOOP_HOME']+'/conf'

module AvroJruby::Read
  class AvroHdfsReader < AbstractAvroReader
    attr_writer :config, :hdfs, :hdfspath
    
    def initialize hdfspath
      @config   = org.apache.hadoop.conf.Configuration.new
      @hdfs     = org.apache.hadoop.fs.FileSystem.get(@config)
      @hdfspath = org.apache.hadoop.fs.Path.new(hdfspath)
      super()
    end

    # blarg. Not gonna work without writing a new class:
    #
    #
    #   public class SeekableHadoopInput extends FilterInputStream implements SeekableInput {
    #     public SeekableHadoopInput(FSDataInputStream in, long length) { 
    #       super(in);
    #       this.length = length;
    #     }
    #     public long length() { return length; }
    #     public void seek(long pos) { ((FSDataInputStream)in).seek(pos); }
    #     public long tell() { return ((FSDataInputStream)in).getPos(); }
    #   }
    #
    
    # def instream
    #   # @instream ||= @hdfs.open(@hdfspath)
    # end
  end
end
