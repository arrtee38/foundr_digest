class AddMissingParamsToUsers < ActiveRecord::Migration[7.0]
  # Adds missing attributes from our data model to users table 
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :job_role, :string
  end
end
