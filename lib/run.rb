#lib/run.rb
require_relative 'validator'
class Run
  include Validator

  def initialize(path)
    @path = path
    @report = []
    @line_nbr = 1
  end
  
  def show_code
    File.foreach(@path) { |line| puts line }
  end
  
  def run_validator
    File.foreach(@path) { |line|
      # line = line.chomp 
      @report <<  "Line:#{@line_nbr} => Use camelCase for identifier names (variables and functions)" if camelcase_name(line) 
      pos = space_around_op(line)
      @report << "Line:#{@line_nbr}|Col:#{pos} => Always put spaces around operators ( = + - * / ), and after commas" if pos
      pos = space_after_comma(line)
      @report << "Line:#{@line_nbr}|Col:#{pos} => Always put a space after commas" if space_after_comma(line)
      @report << "Line:#{@line_nbr} => Always use 2 spaces for indentation of code blocks" if indentation_check(line)  
      @report << "Line:#{@line_nbr} => Name should be camelCase" if semicolon_check(line)  
      @report << "Line:#{@line_nbr} => For readability, avoid lines longer than 80 characters" if line_length(line)
      @line_nbr += 1
    }
    puts "total code length is #{@line_nbr}"
  end

  def display_report
    @report.each do |error|
      puts error
    end
  end

  

end