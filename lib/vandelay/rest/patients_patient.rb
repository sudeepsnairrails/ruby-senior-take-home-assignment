require 'vandelay/services/patients'
require 'vandelay/services/patient_records'

module Vandelay
  module REST
    module PatientsPatient

      def self.patients_srvc
        @patients_srvc ||= Vandelay::Services::Patients.new
      end

      def self.patient_records_srvc
        @patient_record_srvc ||= Vandelay::Services::PatientRecords.new
      end

      def self.registered(app)
        # endpoint to fetch patient record
        app.get '/patients/patient/:id' do
          id = params[:id]
          result = Vandelay::REST::Patients.patients_srvc.retrieve_one(id)
          if result.nil?
            json({ error: 'Patient not found', status: 404, system_time: Vandelay.system_time_now.iso8601})
          else
            json(result.to_h)
          end
        end
      end
    end
  end
end
