class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.string :description
      t.string :address
      t.float :altitude
      t.float :longitude

      t.timestamps
    end
  end
end
