class CreateReads < ActiveRecord::Migration[6.0]
  def change
    create_table :reads do |t|
      t.string :file

      t.timestamps
    end
  end
end
