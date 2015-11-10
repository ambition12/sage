class CreateMyTrends < ActiveRecord::Migration
  def change
    create_table :my_trends do |t|
      t.string :username
      t.string :one
      t.string :two
      t.string :three
      t.string :four
      t.string :five

      t.timestamps
    end
  end
end
