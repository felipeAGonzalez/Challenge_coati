class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
