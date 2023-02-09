class CreateDoctorProfessions < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_professions do |t|
      t.integer :doctor_id
      t.integer :profession_id

      t.timestamps
    end
  end
end
