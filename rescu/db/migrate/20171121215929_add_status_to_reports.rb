class AddStatusToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :status, :string, :default => "Pending Review"
  end
end
