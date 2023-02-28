class UpdateTables < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :contact, :integer
    add_column :doctors, :medical_id, :integer
  end
end
