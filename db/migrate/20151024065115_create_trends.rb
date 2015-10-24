class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.string :noun
      t.integer :count

      t.timestamps
    end
  end
end
