class AddCategoryToComplaints < ActiveRecord::Migration[5.2]
  def change
    add_reference :complaints, :category, foreign_key: true
  end
end
