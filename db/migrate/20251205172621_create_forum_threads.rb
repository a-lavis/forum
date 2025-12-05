class CreateForumThreads < ActiveRecord::Migration[8.1]
  def change
    create_table :forum_threads do |t|
      t.string :title
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
