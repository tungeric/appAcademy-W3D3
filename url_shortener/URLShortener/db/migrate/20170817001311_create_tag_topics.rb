class CreateTagTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_topics do |t|
      t.string :name, null: false
      t.integer :url_id, null: false
      t.timestamps
    end
    add_index :tag_topics, :name
    add_index :tag_topics, :url_id
  end
end
