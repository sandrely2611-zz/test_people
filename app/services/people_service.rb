class PeopleService < SalesloftService
  def list_people
    client.list_people.content[:data]
  end

  def list_emails
    list_people.map {|p| p[:email_address] }
  end
end
