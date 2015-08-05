class CreateCompaniesOperations < ActiveRecord::Migration
  def self.up
    # Create the association table
    create_table :companies_operations, :id => false do |t|
      t.integer :company_id, :null => false
      t.integer :operation_id, :null => false
    end

    # Add table index
    add_index :companies_operations, [:company_id, :operation_id], :unique => false

  end

  def self.down
    remove_index :companies_operations, :column => [:company_id, :operation_id]
    drop_table :companies_operations
  end
end
