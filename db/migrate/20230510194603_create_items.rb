# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :year
      t.integer :item_number
      t.string :item_number_addendum
      t.text :original_item
      t.text :spellchecked_item
      t.string :special_event
      t.string :points
      t.integer :point_value
      t.string :rating
      t.text :comment

      t.timestamps
    end
  end
end
