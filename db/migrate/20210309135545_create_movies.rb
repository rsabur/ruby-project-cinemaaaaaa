class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title 
      t.text :description
      t.string :genre
      t.string :rotten_tomatoes_review
    end
  end
end
