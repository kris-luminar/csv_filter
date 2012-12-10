require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CsvFilter" do
  before do
    @tsv = CsvFilter.new(File.expand_path(File.dirname(__FILE__) + '/sample.tsv'))
  end

  it "should grab just the columns specified" do
    columns = @tsv.filter('value', 'url')
    (columns.gets =~ 'value').should_not be_true
  end

  it "should grep for a string in rows"
  describe "console output"
    it "should send output to stndout"
    it "should return just the columns specified"
  describe "to_file"
    it "should create the named file"
    it "should send success message to stdout"
    it "should not send the file contents to stdout"
    describe "file contents"
      it "should include just the columns specified"
end
