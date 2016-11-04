class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.integer :paper_id
      t.text :author

      t.timestamps null: false
    end
  end
end
