class AddSurNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sur_name, :string
  end
end
