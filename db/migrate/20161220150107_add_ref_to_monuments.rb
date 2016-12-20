class AddRefToMonuments < ActiveRecord::Migration[5.0]
  def change
    add_reference :monuments, :user, foreign_key: true
  end
end
