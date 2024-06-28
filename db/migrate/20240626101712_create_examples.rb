class CreateExamples < ActiveRecord::Migration[7.1]
  def change
    create_table :examples do |t|
      t.references :word, null: false, foreign_key: true
      t.string :lang, null: false
      t.string :text

      t.timestamps
    end
  end
end
