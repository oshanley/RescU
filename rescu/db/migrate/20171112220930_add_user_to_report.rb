class AddUserToReport < ActiveRecord::Migration[5.0]
  def change
    add_reference :reports, :user
    add_foreign_key :reports, :users, on_delete: :cascade
  end
end
