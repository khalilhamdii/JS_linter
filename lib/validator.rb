#lib/validator.rb

module Validator

  #Check if variables and functions use camelCase names
  def camelcase_name(line)
  end

  #Check if there's space around operators
  def space_around_op(line)
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