require 'spec_helper'

RSpec.describe Vandelay::Integrations::VendorTwo do
  let(:patient_vendor_id) { Vandelay::Models::Patient.with_id(3).vendor_id }

  describe 'Vendor One API' do
    it 'return API results' do
      response = described_class.new.retrieve_patient_record(patient_vendor_id)
      expect(response[:patient_id]).to eq '16'
      expect(response[:province]).to eq 'ON'
      expect(response[:allergies]).to eq ['hair', 'mean people', 'paying the bill']
      expect(response[:num_medical_visits]).to eq 17
    end
  end
end