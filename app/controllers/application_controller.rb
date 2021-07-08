class ApplicationController < ActionController::Base
  def api
    @api || PeopleService.new
  end
end
