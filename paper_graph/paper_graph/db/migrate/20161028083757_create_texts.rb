class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.integer :id
      t.text :author

      t.timestamps null: false
    end
  end
end
