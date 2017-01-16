class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :summary
      t.string :genre
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
