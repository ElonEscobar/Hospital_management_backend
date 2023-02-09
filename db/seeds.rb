# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "seeding database..."

10.times do |i|
    Doctor.create(first_name: Faker::Name.unique.name, last_name: Faker::Name.unique.name, contact: 254712345678, password_digest: "doc")
end

puts "doctors created"

10.times do |i|
    Patient.create(first_name: Faker::Name.unique.name, last_name: Faker::Name.unique.name, age: rand(30), gender: Faker::Gender.binary_type, password_digest: "pat")
end

puts "patients created"

Profession.create(name: "dentist", description: "best teeth doctors in the world")
Profession.create(name: "pediatrician", description: "best docs")
Profession.create(name: "ophthalmologist", description: "best docs")
Profession.create(name: "cardiologist", description: "best docs")
Profession.create(name: "neurologist", description: "best docs")
Profession.create(name: "dermatologist", description: "best docs")
Profession.create(name: "psychiatrist", description: "best docs")

puts "professions created"

6.times do |i|
    Appointment.create(doctor_id: rand(10), patient_id: rand(10), complete: Faker::Boolean.boolean)
end

20.times do |i|
    DoctorProfession.create(doctor_id: rand(10), profession_id: rand(10))
end

puts "seeding complete!"