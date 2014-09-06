class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.references :user
    	t.string :name
    	t.string :email
    	t.string :facebook_uid
    	t.string :facebook_oauth_token
      	t.datetime :facebook_oauth_expires_at
      	t.string :phone
      	t.string :pin
      	t.integer :image
      	t.timestamps
    end
  end
end
