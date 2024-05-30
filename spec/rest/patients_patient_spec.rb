require 'spec_helper'
require 'rspec'
require 'rack/test'

RSpec.describe Vandelay::REST::PatientsPatient do
  describe "GET single patient" do
    include Rack::Test::Methods

    context  "patient exists" do
      it "returns  patient" do
          get "/patients/patient/1"
          expect(JSON.parse(last_response.body)["full_name"]).to eq("Elaine Benes")
          expect(last_response.status).to eq(200)
      end
    end
  end
end