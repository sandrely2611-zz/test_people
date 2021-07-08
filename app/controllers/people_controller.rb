class PeopleController < ApplicationController
  def index
    @people = api.list_people
  end

  private

  def api
    @api || PeopleService.new
  end
end
