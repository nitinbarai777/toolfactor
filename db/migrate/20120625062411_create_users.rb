class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :carrier_id
	  t.references :carrier
	  t.references :gateway
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :contact
	  t.string :image
      t.integer :is_admin
      t.boolean :is_active, :default => true
      t.timestamps
    end
	add_index :users, :carrier_id
	add_index :users, :gateway_id
  end
end
