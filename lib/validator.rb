#lib/validator.rb
require_relative 'check'
module Validator
  include Check
  #Check if variables and functions use camelCase names
  def camelcase_name(line)
    if get_name(line)
      name = get_name(line)
      name_index = line.index(/#{name}/)
      return name_index+1 unless /^[a-z]+([A-Z]?[a-z]+)?/.match(name)
    end
  end

  #Check if there's space around operators
  def space_around_op(line)
    op_regexp = /\=|\+|-|\*|\//
    if op_regexp.match(line)
    op_index = line.index(op_regexp)
      return op_index+1 unless / (\=|\+|\-|\*|\/) /.match(line)
    end
    false
  end

  #Check if there's space after commas
  def space_after_comma(line)
    comma_regexp = /,/
    if comma_regexp.match(line)
    op_index = line.index(comma_regexp)
      return op_index+1 unless /, /.match(line)
    end
    false
  end

  #Check for indentation
  def indentation_check(line)
    if is_a_block?(line)
      indentation_index = 0
      return indentation_index+1 unless /^(\s\s)/.match(line)
    end
  end

  #Check for semicolon
  def semicolon_check(line)
    if is_a_block?(line)
      semicolon_index = line.length
      return semicolon_index+1 unless /;$/.match(line)
    end
  end

  #Check for line length
  def line_length(line)
    return line.length > 80 ? true : false 
  end


end