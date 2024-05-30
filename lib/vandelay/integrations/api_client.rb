require 'net/http'
require 'json'

module Vandelay
  module Integrations
    class ApiClient
        def retrieve_patient_record(patient_id)
          # Create HTTP GET request with given path, authorization and Content-Type
          request = Net::HTTP::Get.new(path + "#{patient_id}")
          request['Authorization'] = "Bearer #{get_bearer_token(auth_url)}"
          request['Content-Type'] = 'application/json'

          http = Net::HTTP.new(host, 80)
          
          # Make HTTP request
          response = http.request(request)

          return { error: "HTTP request failed with status code: #{response.code}", status: 422 } unless response.is_a? Net::HTTPSuccess

          get_required_info(JSON.parse(response.body))
        end

        private

        def get_bearer_token(auth_url)
          uri = URI(auth_url)
           # Make HTTP request
          response = Net::HTTP.get_response(uri)

          if response.is_a? Net::HTTPSuccess
            response['token'] || response['auth_token']
          else
            { error: "HTTP request failed", status: 422 }
          end
        end

        def get_required_info(response) #Method to fetch needed info
          {
            patient_id: response['id'],
            province: response['province'] || response['province_code'],
            allergies: response['allergies'] || response['allergies_list'],
            num_medical_visits: response['recent_medical_visits'] || response['medical_visits_recently']
          }
        end
      end
    end
end