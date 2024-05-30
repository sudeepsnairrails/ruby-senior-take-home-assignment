require_relative './api_client'

module Vandelay
  module Integrations
      class VendorTwo < Vandelay::Integrations::ApiClient
        API_URL = Vandelay.config.dig('integrations', 'vendors', 'two', 'api_base_url')

        def path
          '/records/'
        end

        def host
          'mock_api_two'
        end

        def auth_url
          "http://#{API_URL}/auth_tokens/1"
        end
    end
  end
end