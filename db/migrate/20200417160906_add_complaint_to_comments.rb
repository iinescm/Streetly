class AddComplaintToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :complaint, foreign_key: true

  end
end
