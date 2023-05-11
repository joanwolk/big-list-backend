# frozen_string_literal: true

class AddErrataToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :errata, :text
  end
end
