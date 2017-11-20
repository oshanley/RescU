class AddFullAddressToReport < ActiveRecord::Migration[5.0]
  def change
  add_column :reports, :full_address, :string
  end
end
