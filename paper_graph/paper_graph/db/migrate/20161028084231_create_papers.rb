class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.integer :paper_id
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
