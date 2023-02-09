class Profession < ApplicationRecord
    has_many :doctor_professions
    has_many :doctors, through: :doctor_professions
end
