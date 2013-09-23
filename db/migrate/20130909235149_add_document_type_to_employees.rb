class AddDocumentTypeToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :document_type, :string
  end
end
