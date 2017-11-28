class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :name
    	t.string :place_type
    	t.string :property_type
    	t.integer :guest_number
    	t.string :country
    	t.string :state
    	t.string :city
    	t.integer :zipcode
    	t.string :address
    	t.integer :price
    	t.string :description
    	t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
