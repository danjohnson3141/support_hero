class CreateHeroSchedules < ActiveRecord::Migration
  def change
    create_table :hero_schedules do |t|
      t.date :scheduled_on
      t.references :hero, index: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
    add_index :hero_schedules, :created_by
    add_index :hero_schedules, :updated_by
    add_index :hero_schedules, [:hero_id, :scheduled_on]
    add_foreign_key :hero_schedules, :heroes
  end
end
