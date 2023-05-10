# frozen_string_literal: true

class Item < ApplicationRecord

  scope :year, ->(year = nil){ year ? (where("year = ?", year)) : all}
  scope :item_number, -> (number = nil) { number ? (where("item_number = ?", number)) : all }
  scope :item_text, -> (text = "") { where("original_item LIKE ?", "%#{text}%") }
  scope :points, -> (number = nil) { number ? (where("point_value = ?", number)) : all }
  scope :filter_by_params, ->(params){
    year(params[:year])
    .item_number(params[:item_number])
    .item_text(params[:item_text])
    .points(params[:points])
  }

  def self.populate_from_list
    worksheet = GoogleService.worksheet
    items = worksheet.worksheet.rows.map do |row|
      worksheet.row_to_item_hash(row)
    end
    Item.create(items)
  end
end
