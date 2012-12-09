require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CsvFilter" do
  it "should create a new object from a file"
  it "should grab just the columns specified"
  it "should return just the columns specified"
  it "should send output to stndout"
  describe "to_file"
    it "should create the named file"
    it "should send success message to stdout"
    it "should not send the file contents to stdout"
    describe "file contents"
      it "should include just the columns specified"
  describe 'grep'
    it "should grep for a string in rows"
    it "should only show the grepped rows"
end
