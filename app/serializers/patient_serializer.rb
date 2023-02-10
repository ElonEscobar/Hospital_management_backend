class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :age, :gender

  has_many :doctors
end
