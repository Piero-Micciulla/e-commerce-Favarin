class AddNameLastToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name_last, :string
  end
end
