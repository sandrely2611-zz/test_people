require 'test_helper'

class PersonDecoratorTest < ActiveSupport::TestCase
  test 'Person decorator' do
    person = PersonDecorator.new({ first_name: 'Sandra', last_name: 'Muñoz', email_address: "sandrely2611@gmail.com", title: 'Product Owner'})
    assert_equal 'Sandra Muñoz', person.name
    assert_equal 'sandrely2611@gmail.com', person.email
    assert_equal 'Product Owner', person.job_position
  end
end
