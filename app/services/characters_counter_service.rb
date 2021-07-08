class CharactersCounterService
  attr_reader :list

  def initialize(strings)
    @list = Hash.new(0)
    counter_strings(strings)
  end

  def char_list
    list
  end

  private

  def counter_strings(strings)
    strings.each do |string|
      string.each_char do |char|
        list[char] += 1
      end
    end
  end
end
