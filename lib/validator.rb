#lib/validator.rb

module Validator

  #Check if variables and functions use camelCase names
  def camelcase_name(line)
  end

  #Check if there's space around operators
  def space_around_op(line)
    op_regexp = /\=|\+|\-|\*|\//
    if op_regexp.match(line)
    op_index = line.index(op_regexp)
      return op_index unless / #{line[op_index]} /.match(line)
    end
    false
  end

  #Check if there's space after commas
  def space_after_comma(line)
    comma_regexp = /,/
    if comma_regexp.match(line)
    op_index = line.index(comma_regexp)
      return op_index unless /, /.match(line)
    end
    false
  end

  #Check for indentation
  def indentation_check(line)
  end

  #Check for semicolon
  def semicolon_check(line)
  end

  #Check for line length
  def line_length(line)
    return line.length > 80 ? true : false 
  end


end