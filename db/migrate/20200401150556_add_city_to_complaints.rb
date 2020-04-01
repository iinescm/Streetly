class AddCityToComplaints < ActiveRecord::Migration[5.2]
  def change
    add_reference :complaints, :city, foreign_key: true
  end
end
