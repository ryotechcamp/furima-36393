class CreateDisplays < ActiveRecord::Migration[6.0]
  def change
    create_table :displays do |t|
      t.references :user,     null: false ,foreign_key: true
      t.string :display_name, null: false
      t.text :instruction,    null: false
      t.integer :genre_id,    null: false
      t.integer :status_id,   null: false
      t.integer :load_id,     null: false
      t.integer :area_id,     null: false
      t.integer :day_id,      null: false
      t.integer :price,       null: false
      t.timestamps
    end
  end
end
