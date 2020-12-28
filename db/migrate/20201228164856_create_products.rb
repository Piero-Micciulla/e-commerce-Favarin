class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :price
      t.string :reference_number
      t.string :category
      t.boolean :sold_status

      t.timestamps
    end
  end
end
