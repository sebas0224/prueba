class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :status
      #t.string :password_reset_token

      t.timestamps null: false
    end
  end
end
