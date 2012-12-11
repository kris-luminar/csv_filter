# @author Kris Luminar
class CsvFilter
  # @param file_path the full path to a file
  def initialize file_path, separator = "\t"
    STDOUT.flush
    @file = File.open(file_path, 'r')
    @separator = separator
    @num_columns = count_columns
    @header = {}
    grab_header
  end

  def grab_header
    return @header if (@header and !@header.empty?)
    @file.rewind
    fields.each_with_index do |field_name, i|
      @header[i]= field_name.strip
    end
    @header
  end

  def filtered_column_positions columns
    columns = columns.flatten
    @filtered_column_positions ||= register.select {|field, pos| columns.include? field }.values
  end

  def register
    grab_header.invert
  end

  def filter(*columns)
    # columns = [*columns].flatten #columns should accept either an array of strings or a variable number of strings
    raise ArgumentError unless (columns.respond_to?(:size) and columns.size < @num_columns)
    output = []
    @file.each_with_index do |line, i|
      #TODO: Decide wther to allow user to specify if header row exists. If so, this step will be conditional. Else, add proviso to the README that csv file must include a header line.
      next if i == 0 # skip header row
      row = {}
      line.split(@separator).each_with_index do |value, j|
        if filtered_column_positions(columns).include? j
          row[@header[j]] = value
        end
      end
      output << row
    end
    output
  end

  def print_filter(columns)
    lines = filter(columns)
    output = []
    lines.each_with_index do |line, i|
      row = "#{i}. "
      line.each do |k,v|
        row << "#{v}\t"
      end
      output << row
    end
    puts output.join("\n")
  end

  def count_columns
    fields.size
  end

  def fields
    return @fields if @fields
    @file.rewind
    @fields = @file.gets.split(@separator).map &:strip
  end

end
