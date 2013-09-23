class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :sex
      t.string :address
      t.boolean :trainer

      t.timestamps
    end
  end
end
