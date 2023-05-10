# frozen_string_literal: true

class Item < ApplicationRecord

  def self.populate_from_list
    worksheet = GoogleService.worksheet
    items = worksheet.worksheet.rows.map do |row|
      worksheet.row_to_item_hash(row)
    end
    Item.create(items)
  end
end
