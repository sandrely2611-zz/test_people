class PeopleController < ApplicationController
  def index
    @people = api.list_people
  end
end
