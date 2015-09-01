class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.string :first_name, limit: 100
      t.string :last_name, limit: 100
      t.string :title
      t.text :bio
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
    add_index :heroes, :created_by
    add_index :heroes, :updated_by
  end
end
