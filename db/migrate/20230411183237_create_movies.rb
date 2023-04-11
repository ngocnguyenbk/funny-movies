class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :description, null: false
      t.string :url, null: false
      t.string :thumbnail_url, null: false

      t.timestamps
    end
  end
end
