class AddStarToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :star, :string
  end
end
