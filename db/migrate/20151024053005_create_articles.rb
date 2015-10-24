class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :url
      t.string :genre
      t.integer :count

      t.timestamps
    end
  end
end
