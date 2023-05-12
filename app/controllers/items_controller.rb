# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    permitted_params = params.permit(:year, :item_number, :item_text, :points, :rating).reject{|_, v| v.blank?}
    render json: Item.filter_by_params(permitted_params)
  end
end
