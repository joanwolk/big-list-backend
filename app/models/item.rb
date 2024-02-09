# frozen_string_literal: true

class Item < ApplicationRecord
  RATINGS = ['', '?', 'Safe', 'Caution', 'NSFP'].freeze
  scope :year, ->(year = nil) { year ? where(year:) : all }
  scope :item_number, ->(number = nil) { number ? where(item_number: number) : all }
  scope :item_text, ->(text = '') { where('LOWER(original_item) LIKE ?', "%#{text}%") }
  scope :points, ->(number = nil) { number ? where(point_value: number) : all }
  scope :rating, ->(rated = 'Caution') {
    accepted_ratings_index = (RATINGS.map(&:downcase).index(rated&.downcase) || 3) + 1
    accepted_ratings = RATINGS.slice(0, accepted_ratings_index)
    where(rating: accepted_ratings)
  }
  scope :filter_by_params, ->(params) {
    year(params[:year])
      .item_number(params[:item_number])
      .item_text(params[:item_text])
      .points(params[:points])
      .rating(params[:rating])
  }

  def self.populate_from_list
    worksheet = GoogleService.worksheet
    items = worksheet.worksheet.rows.map do |row|
      worksheet.row_to_item_hash(row)
    end
    Item.create(items)
  end
end
