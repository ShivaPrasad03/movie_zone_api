class ReCol < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :name, :movie_name
  end
end
