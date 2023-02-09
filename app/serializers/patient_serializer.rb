class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :age, :gender, :password_digest
end
