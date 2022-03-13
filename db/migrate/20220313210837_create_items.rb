class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_detail
      t.float :item_prize
      t.integer :total_items

      t.timestamps
    end
  end
end
