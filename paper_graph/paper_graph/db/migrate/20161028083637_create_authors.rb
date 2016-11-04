class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :paper_id
      t.string :author

      t.timestamps null: false
    end
  end
end
