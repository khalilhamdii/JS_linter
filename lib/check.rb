# lib/check.rb

module Check
  def var_in_line?(str)
    var_regexp = /^var |^let |^const |(\s?(\w)+(\s)?(\=))/
    return true if var_regexp.match(str)
  end

  def func_in_line?(str)
    func_regexp = /^function/
    return true if func_regexp.match(str)
  end

  def get_name(str)
    if func_in_line?(str)
      name_match = / (\w)+/.match(str).to_s.gsub(' ', '')
    elsif var_in_line?(str)
      name_match = /\s?(\w)+(\s)?(\=)/.match(str).to_s.gsub(' ', '').gsub('=', '')
    end
    name_match
  end

  def is_a_block?(str)
    block_regexp = /^}|{$/
    return true unless block_regexp.match(str)
  end
end
