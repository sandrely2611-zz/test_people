class PeopleService < SalesloftService
  def list_people
    client.list_people.content[:data]
  end
end
