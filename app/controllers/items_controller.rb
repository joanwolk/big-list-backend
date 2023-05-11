# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    permitted_params = params.permit(:year, :item_number, :item_text, :points, :rating)
    render json: Item.filter_by_params(permitted_params)
  end
end
