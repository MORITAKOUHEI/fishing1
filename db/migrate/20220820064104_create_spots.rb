class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|

      t.string :post_name
      t.text   :caught_fish

      t.timestamps
    end
  end
end
