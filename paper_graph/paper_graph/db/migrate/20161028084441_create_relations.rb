class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :src_id
      t.integer :dst_id
      t.string :type
      t.float :strength

      t.timestamps null: false
    end
  end
end
