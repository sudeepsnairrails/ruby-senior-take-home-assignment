require_relative './api_client'
module Vandelay
  module Integrations
      class VendorOne < Vandelay::Integrations::ApiClient
        API_URL = Vandelay.config.dig('integrations', 'vendors', 'one', 'api_base_url')

        def path
          '/patients/'
        end

        def host
          'mock_api_one'
        end

        def auth_url
          "http://#{API_URL}/auth/1"
        end
    end
  end
end