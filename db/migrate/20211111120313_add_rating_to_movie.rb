class AddRatingToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :rating, :float
  end
end
