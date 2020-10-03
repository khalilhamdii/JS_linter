# lib/run.rb
require_relative 'validator'
class Run
  include Validator
  attr_reader :path, :report, :line_nbr
  def initialize(path)
    @path = path
    @report = []
    @line_nbr = 1
  end

  def run_validator
    File.foreach(@path) do |line|
      pos = camelcase_name(line)
      @report << "Ln:#{@line_nbr}, Col:#{pos} => Use camelCase for identifier names (variables and functions)." if pos
      pos = space_around_op(line)
      @report << "Ln:#{@line_nbr}, Col:#{pos} => Always put spaces around operators ( = + - * / )." if pos
      pos = space_after_comma(line)
      @report << "Ln:#{@line_nbr}, Col:#{pos} => Always put a space after commas." if space_after_comma(line)
      pos = indentation_check(line)
      @report << "Ln:#{@line_nbr}, Col:#{pos} => Always use 2 spaces for indentation of code blocks." if pos
      pos = semicolon_check(line)
      @report << "Ln:#{@line_nbr}, Col:#{pos} => Each line of code should end with a semicolon." if pos
      if line_length(line)
        @report << "Ln:#{@line_nbr}, Col:0 => For readability, avoid lines longer than 80 characters."
      end
      @line_nbr += 1
    end
  end

  def display_report
    puts "total code length is #{@line_nbr}"
    puts @report.length == 1 ? '1 error found !' : "#{@report.length} errors found !"
    @report.each do |error|
      puts error
    end
  end
end
