class AddDocumentNumberToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :document_number, :int
  end
end
