class RemovePostNameFromSpots < ActiveRecord::Migration[6.1]
  def change
    remove_column :spots, :post_name, :string
  end
end
