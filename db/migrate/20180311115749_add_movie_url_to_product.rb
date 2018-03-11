class AddMovieUrlToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :movie_url, :string
  end
end
