class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :image_id
      t.text :title, null: false
      t.text :content, null: false
      t.integer :user_id
      t.integer :answer_id
      t.integer :making_genre_id
      t.integer :bread_genre_id
      t.boolean :is_resolved, null: false, default: false

      t.timestamps
    end
  end
end
