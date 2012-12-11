require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CsvFilter" do
  before do
    @tsv = CsvFilter.new(File.expand_path(File.dirname(__FILE__) + '/sample.tsv'))
  end

  it "#filter should grab just the columns specified" do
    fields = ['value', 'url']
    columns = @tsv.filter(fields)
    columns.first.keys.should eq fields
  end

  it "should know how many columns exist" do
    @tsv.count_columns.should be 4
  end

  # it "#filter should accept either an array of strings or a variable number of strings" do
  #   fields = ['value', 'url']
  #   columns = @tsv.filter(fields)
  #   columns.first.keys.should eq fields

  #   columns = @tsv.filter('value', 'url')
  #   columns.first.keys.should eq fields
  # end

  it "should retrieve the header row" do
    header = @tsv.grab_header
    header.should be_an_instance_of(Hash)
    header.values.should eq @tsv.fields
  end

  it "should know the position of columns based on name" do
    @tsv.filtered_column_positions(['value', 'url']).should eq [0, 2]
  end

  it "should know the columns and their positions" do
    register = @tsv.register
    register.should be_an_instance_of Hash
    register.keys.should eq @tsv.fields
    register['url'].should eq 2
  end

  #exit code and puts warning rather than raising an exception
  it "should return a warning if all args not in header line"

  describe "console output"
    it "should send output to stndout"
    it "should return just the columns specified"
end
