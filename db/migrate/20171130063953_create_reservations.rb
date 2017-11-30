class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|

    	x.references :user, foreign_key: true
    	x.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
