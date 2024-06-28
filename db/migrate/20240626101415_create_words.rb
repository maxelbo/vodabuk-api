class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words do |t|
      t.string :lang, null: false
      t.string :word, null: false
      t.text :roots
      t.string :letter
      t.string :category

      t.timestamps
    end
    
    add_index :words, [:lang, :word], unique: true
  end
end
