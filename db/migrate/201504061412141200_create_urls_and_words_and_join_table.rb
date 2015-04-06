class CreateWords < ActiveRecord::Migration
  def change

    create_table :urls do |t|
      t.string :value
      t.timestamps
    end

    create_table :words do |t|
      t.string :value
      t.timestamps
    end

    create_table :urls_words, id: false do |t|
      t.integer :url_id
      t.integer :word_id
    end

    add_index :urls_words, :urls_id
    add_index :urls_words, :word_id
  end
end
