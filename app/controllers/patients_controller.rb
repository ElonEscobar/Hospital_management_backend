class PatientsController < ApplicationController
    def index
        patient = Patient.all
        render json: patient
    end
end
