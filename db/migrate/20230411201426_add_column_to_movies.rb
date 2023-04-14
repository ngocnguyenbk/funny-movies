class AddColumnToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :likes_count, :integer, default: 0
    add_column :movies, :dislikes_count, :integer, default: 0
  end
end
