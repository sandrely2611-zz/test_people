require 'test_helper'

class CharacterCounterServiceTest < ActiveSupport::TestCase
  test 'Character Counter' do
    list = CharactersCounterService.new(["sandrely2611@gmail.com", "sandrely2611@gmail.com"]).char_list
    assert_equal list['s'], 2
    assert_equal list['a'], 4
    assert_equal list['n'], 2
    assert_equal list['d'], 2
    assert_equal list['r'], 2
    assert_equal list['e'], 2
    assert_equal list['l'], 4
    assert_equal list['y'], 2
    assert_equal list['2'], 2
    assert_equal list['6'], 2
    assert_equal list['1'], 4
    assert_equal list['@'], 2
    assert_equal list['g'], 2
    assert_equal list['m'], 4
    assert_equal list['i'], 2
    assert_equal list['.'], 2
    assert_equal list['c'], 2
    assert_equal list['o'], 2
  end
end
