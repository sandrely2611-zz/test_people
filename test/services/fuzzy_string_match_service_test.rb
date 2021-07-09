require 'test_helper'

class FuzzyStringMatchServiceTest < ActiveSupport::TestCase
  test 'close_match?' do
    fuzzy = FuzzyStringMatchService.new
    assert fuzzy.close_match?("sandrely2611@gmail.com", "sandrely2612@gmail.com")
    refute fuzzy.close_match?("ruby@gmail.com", "edgar@gmail.com")
  end
end
