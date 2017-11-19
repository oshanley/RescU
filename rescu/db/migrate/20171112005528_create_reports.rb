class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :description 
      t.string :address
      t.string :severity
      t.boolean :anonymous
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
