class DuplicatedStringsService
  attr_reader :list, :fuzzy
  attr_accessor :strings

  def initialize(strings)
    @list = Hash.new { |hash, key| hash[key] = [] }
    @strings = strings
    initialize_fuzzy
    iterate_key_strings
  end

  def fetch_list
    list
  end

  private

  def initialize_fuzzy
    @fuzzy = FuzzyStringMatchService.new
  end

  def close?(string1, string2)
    fuzzy.close_match?(string1, string2)
  end

  def iterate_key_strings
    strings.each do |string|
      iterate_value_substrings(string)
    end
  end

  def iterate_value_substrings(reference_string)
    strings.delete_if do |compare_string|
      next if reference_string === compare_string
      list[reference_string] += [compare_string] if close?(reference_string, compare_string)
    end
  end
end
