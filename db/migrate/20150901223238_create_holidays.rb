class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.date :holiday_date, null: false
      t.string :name, limit: 100
      t.text :description
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
    add_index :holidays, :holiday_date, unique: true
    add_index :holidays, :created_by
    add_index :holidays, :updated_by
  end
end
