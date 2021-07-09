class DuplicatedEmailsController < ApplicationController
  def index
    @list = DuplicatedStringsService.new(api.list_emails).fetch_list
  end
end
