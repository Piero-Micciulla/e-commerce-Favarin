class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.text :address
      t.text :city
      t.text :post_code
      t.text :country
      t.text :name
      t.text :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
