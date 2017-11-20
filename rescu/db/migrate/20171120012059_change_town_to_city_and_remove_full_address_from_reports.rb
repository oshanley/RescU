class ChangeTownToCityAndRemoveFullAddressFromReports < ActiveRecord::Migration[5.0]
  def change
    remove_column :reports, :full_address
    rename_column :reports, :town, :city
    add_column :reports, :country, :string
  end
end
