class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :facebook_uid
      	t.string :phone
      	t.string :pin
      	t.integer :image
      	t.timestamps
    end
  end
end
