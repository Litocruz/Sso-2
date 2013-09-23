class CreateDriverLicenses < ActiveRecord::Migration
  def change
    create_table :driver_licenses do |t|
      t.string :code
      t.date :expiration
      t.integer :employee_id

      t.timestamps
    end
    add_index :driver_licenses, [:employee_id, :created_at]
  end
end
