class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name, :last_name, :username
      t.string :image_url, :large_image_url, :small_image_url, :square_image_url
      t.string :facebook_idx
      t.integer :score

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :facebook_idx
    add_index :users, :score
  end
end
