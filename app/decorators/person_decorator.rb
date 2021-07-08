class PersonDecorator
  attr_reader :name, :email, :job_position

  def initialize(person)
    @person = person
  end

  def name
    "#{@person[:first_name]} #{@person[:last_name]}"
  end

  def email
    @person[:email_address]
  end

  def job_position
    @person[:title]
  end
end
