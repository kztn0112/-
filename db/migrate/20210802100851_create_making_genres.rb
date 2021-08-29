class CreateMakingGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :making_genres do |t|
      t.integer :name, null: false  #コンソールでname作成

      t.timestamps
    end
  end
end
