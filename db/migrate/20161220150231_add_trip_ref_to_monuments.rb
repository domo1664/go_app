class AddTripRefToMonuments < ActiveRecord::Migration[5.0]
  def change
    add_reference :monuments, :trip, foreign_key: true
  end
end
