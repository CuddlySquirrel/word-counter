class CreateUrlsAndWordsAndJoinTable < ActiveRecord::Migration
  def change

    create_table :urls do |t|
      t.string :value
      t.timestamps null: false
    end

    create_table :words do |t|
      t.string :value
      t.timestamps null: false
    end

    create_table :popularities, id: false do |t|
      t.belongs_to :url, index: true
      t.belongs_to :word, index: true
      t.integer :occurrences
      t.timestamps null: false
    end

  end
end
