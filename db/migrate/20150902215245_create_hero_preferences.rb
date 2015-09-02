class CreateHeroPreferences < ActiveRecord::Migration
  def change
    create_table :hero_preferences do |t|
      t.date :scheduled_on
      t.references :hero, index: true
      t.boolean :can_schedule
      t.text :notes
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
    add_index :hero_preferences, :created_by
    add_index :hero_preferences, :updated_by
    add_index :hero_preferences, [:hero_id, :scheduled_on]
    add_foreign_key :hero_preferences, :heroes
  end
end
