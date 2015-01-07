class CreateClearanceUsers < ActiveRecord::Migration
  def change
    create_table :users  do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :name, null: false, default: ''
    end

    add_index :users, :email
  end
end
