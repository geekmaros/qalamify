class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.datetime :published_at
      t.integer :reading_time
      t.text :summary

      t.timestamps
    end
  end
end
