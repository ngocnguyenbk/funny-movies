class AddIndexToUrlMovies < ActiveRecord::Migration[7.0]
  def change
    add_index :movies, :url, unique: true
  end
end
