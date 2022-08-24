class AddPrefectureNameToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :prefecture_name, :string
  end
end
