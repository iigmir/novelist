class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :novels_id
      t.integer :chapter
      t.string :subtitle # For example, "1000: The Death of a Hero" in Q&A
      t.text :context

      t.timestamps
    end
  end
end
