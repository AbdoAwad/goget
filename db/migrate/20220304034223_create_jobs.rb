class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :pickup_street, null: false
      t.string :pickup_city, null: false
      t.string :pickup_state, null: false
      t.integer :pickup_postcode, null: false
      t.string :drop_off_street, null: false
      t.string :drop_off_city, null: false
      t.string :drop_off_state, null: false
      t.integer :drop_off_postcode, null: false
      t.decimal :pickup_latitude 
      t.decimal :pickup_longitude
      t.decimal :drop_off_latitude
      t.decimal :drop_off_longitude
      t.integer :status
      t.integer :user_id
      t.integer :gogeter_id
      t.index :gogeter_id
      t.index :user_id
      # t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
