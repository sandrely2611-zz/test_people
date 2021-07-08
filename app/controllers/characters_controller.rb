class CharactersController < ApplicationController
  def index
    @list = CharactersCounterService.new(api.list_emails).char_list
  end
end
