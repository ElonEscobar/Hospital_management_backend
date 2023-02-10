class DoctorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        doctors = Doctor.all
        render json: doctors        
    end

    def show
        doctor = Doctor.find(params[:id])
        render json: doctor
    end

    def create
        doctor = Doctor.create!(doctor_params)
        render json: doctor, status: :created
    end

    def update
        doctor = Doctor.update!(doctor_update_params)
        render json: doctor, status: :accepted
    end

    def destroy
        doctor = Doctor.find_by(id: params[:id])
        doctor.destroy!
        head :no_content
    end

    private

    def doctor_params
        params.permit(:first_name, :last_name, :contact, :password, :password_confirmation)
    end

    def doctor_update_params
        params.permit(:first_name, :last_name, :contact)
    end 

    def render_not_found_response
        render json: { error: "Doctor not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
