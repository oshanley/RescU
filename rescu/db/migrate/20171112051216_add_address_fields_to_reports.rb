class AddAddressFieldsToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :town, :string
    add_column :reports, :state, :string
    add_column :reports, :zipcode, :string
  end
end
