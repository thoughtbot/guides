class CreateClearanceUsers < ActiveRecord::Migration
  def change
    create_table :users  do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :name, null: false, default: ''
      t.references :company
    end

    add_index :users, :email
    add_foreign_key :users, :company_id, on_delete: :restrict
  end
end
