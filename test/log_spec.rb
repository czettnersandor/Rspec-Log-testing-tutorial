require './lib/log.rb'
LOGFILEPATH = '/tmp/loggertest.log'

describe Log do
  before(:all) do
    @log = Log.new(LOGFILEPATH)
  end
  after(:all) do
    File.delete(LOGFILEPATH)
  end
  
  it "should exist after instantiation" do
    File.exist?(LOGFILEPATH).should be_true
  end
  
  it "shouldn't be overwrittean after re-instantiation" do
    @log.log_write "Hello World"
    @log.close
    @log = nil
    @log = Log.new(LOGFILEPATH)
    File.size(LOGFILEPATH).should > 0
  end
end