require 'fuzzystringmatch'

class FuzzyStringMatchService
  MATCH_DISTANCE = 0.9

  attr_reader :jarow

  def initialize
    @jarow = FuzzyStringMatch::JaroWinkler.create( :native )
  end

  def close_match?(string1, string2)
    get_distance(string1, string2) > MATCH_DISTANCE
  end

  private

  def get_distance(string1, string2)
    jarow.getDistance(string1, string2)
  end
end
