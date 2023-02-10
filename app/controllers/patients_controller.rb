class PatientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        patients = Patient.all
        render json: patients        
    end

    def show
        patient = Patient.find(params[:id])
        render json: patient
    end

    def create
        patient = Patient.create!(patient_params)
        render json: patient, status: :created
    end

    def update
        patient = Patient.update!(patient_update_params)
        render json: patient, status: :accepted
    end

    def destroy
        patient = Patient.find_by(id: params[:id])
        patient.destroy!
        head :no_content
    end

    private

    def patient_params
        params.permit(:first_name, :last_name, :contact, :password, :password_confirmation)
    end

    def patient_update_params
        params.permit(:first_name, :last_name, :contact)
    end 

    def render_not_found_response
        render json: { error: "Patient not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
