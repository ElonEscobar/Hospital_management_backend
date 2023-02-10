class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :contact

  has_many :patients
end
