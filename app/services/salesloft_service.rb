class SalesloftService
  require 'api_salesloft'

  private

  def client
    @client ||= ApiSalesloft.rest(Rails.application.credentials.api_salesloft[:auth_token])
  end
end
