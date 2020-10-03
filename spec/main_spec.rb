# spec/main_spec.rb
# rubocop: disable Layout/LineLength
require_relative '../lib/run.rb'
require_relative '../lib/validator.rb'
require_relative '../lib/check.rb'

describe Run.new('test_file.js') do
  it { is_expected.to have_attributes(path: 'test_file.js') }
  it { is_expected.to have_attributes(report: []) }
  it { is_expected.to have_attributes(line_nbr: 1) }
end

describe Check do
  include Check
  let(:line_sample1) { "let playerName = 'khalil';" }
  let(:line_sample2) { 'function add(argument1,argument2){' }
  let(:line_sample3) { 'let a = b + c ;' }

  describe '#var_in_line?' do
    it "Should return true if there's a variable declaration in the line of code" do
      expect(var_in_line?(line_sample1)).to eql(true)
    end
  end

  describe '#func_in_line?' do
    it "Should return true if there's a function declaration in the line of code" do
      expect(func_in_line?(line_sample2)).to eql(true)
    end
  end

  describe '#get_name' do
    it 'Should return the name of the variable or function declared in the line of code' do
      expect(get_name(line_sample1)).to eql('playerName')
    end
    it 'Should return the name of the variable or function declared in the line of code' do
      expect(get_name(line_sample2)).to eql('add')
    end
  end

  describe '#a_block?' do
    it 'Should return true if the line is a block of code' do
      expect(a_block?(line_sample3)).to eql(true)
    end
    it "Should return false if the line isn't a block of code" do
      expect(a_block?(line_sample2)).not_to eql(true)
    end
  end
end

describe Validator do
  include Check
  include Validator
  let(:line_sample1) { "let playerName = 'khalil';" }
  let(:line_sample2) { 'function Add(argument1,argument2){' }
  let(:line_sample3) { 'a = b + c;' }
  let(:line_sample4) { 'a=b+ c' }
  let(:line_sample5) { '[a,b,c]' }
  let(:line_sample6) { '  a = b + c;' }
  let(:line_sample7) { "function game(argument1,argument2){let playerName = 'player1'; let playerStatus = 'nil';let playerRecord = '0';}" }

  describe '#camelcase_name' do
    it 'Should return false if camelCase is used for identifier names (variables and functions).' do
      expect(camelcase_name(line_sample1)).to eql(false)
    end
    it 'Should return the position of the name not written in camelCase.' do
      expect(camelcase_name(line_sample2)).to eql(10)
    end
  end

  describe '#space_around_op' do
    it "Should return false if there's spaces around operators ( = + - * / )." do
      expect(space_around_op(line_sample3)).to eql(false)
    end
    it 'Should return the position of the operator with no spaces around.' do
      expect(space_around_op(line_sample4)).to eql(2)
    end
  end

  describe '#space_after_comma' do
    it "Should return the position of the comma if there's no space after it." do
      expect(space_after_comma(line_sample5)).to eql(3)
    end
  end

  describe '#indentation_check' do
    it "Should return false if there's 2 spaces for indentation of code blocks." do
      expect(indentation_check(line_sample6)).to eql(false)
    end
    it 'Should return the position of where should be an indentation.' do
      expect(indentation_check(line_sample3)).to eql(1)
    end
  end

  describe '#semicolon_check' do
    it "Should return false if there's a semicolon at the end of code block." do
      expect(semicolon_check(line_sample3)).to eql(false)
    end
    it 'Should return the position of where should be a semicolon.' do
      expect(semicolon_check(line_sample4)).to eql(7)
    end
  end

  describe '#line_length' do
    it 'Should return false if the length of the line is < 80.' do
      expect(line_length(line_sample3)).to eql(false)
    end
    it 'Should return true if the length of the line is > 80.' do
      expect(line_length(line_sample7)).to eql(true)
    end
  end
end

# rubocop: enable Layout/LineLength
