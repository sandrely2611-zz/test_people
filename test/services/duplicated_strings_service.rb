require 'test_helper'

class DuplicatedStringsServiceTest < ActiveSupport::TestCase
  test 'result list with one coincidences' do
    dstrings = DuplicatedStringsService.new(["san@gmail.com", "zan@gmail.com", "andy@gmail.com"])
    list = dstrings.fetch_list
    assert_equal "san@gmail.com", list.keys.first
    assert_equal ["zan@gmail.com", "andy@gmail.com"], list["san@gmail.com"]
  end

  test 'result list with two coincidences' do
    dstrings = DuplicatedStringsService.new(["san@gmail.com", "zan@gmail.com", "andy@gmail.com", "ruby87@gmail.com", "ggruby8@gmail.com", "ruby86@gmail.com"])
    list = dstrings.fetch_list
    assert_equal "san@gmail.com", list.keys.first
    assert_equal ["zan@gmail.com", "andy@gmail.com"], list["san@gmail.com"]
    assert_equal "ruby87@gmail.com", list.keys.second
    assert_equal ["ruby86@gmail.com"], list["ruby87@gmail.com"]
  end

  test 'result list with any coincidences' do
    dstrings = DuplicatedStringsService.new(["san@gmail.com", "karla@gmail.com", "karen2611@gmail.com"])
    list = dstrings.fetch_list
    assert_equal 0, list.keys.count
  end
end
