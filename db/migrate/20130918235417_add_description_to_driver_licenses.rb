class AddDescriptionToDriverLicenses < ActiveRecord::Migration
  def change
    add_column :driver_licenses, :description, :string
  end
end
