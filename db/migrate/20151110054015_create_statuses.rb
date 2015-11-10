class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :username
      t.integer :game
      t.integer :anime
      t.integer :economy
      t.integer :entame
      t.integer :sports
      t.integer :tech
      t.integer :life
      t.integer :tour
      t.integer :gourmet

      t.timestamps
    end
  end
end
