class AddSpotNameToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :spot_name, :string
  end
end