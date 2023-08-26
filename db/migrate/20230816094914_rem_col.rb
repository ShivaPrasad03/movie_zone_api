class RemCol < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :user_id
  end
end
