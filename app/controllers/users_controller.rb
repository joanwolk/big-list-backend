# frozen_string_literal: true

class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  def show
    # permitted_params = params.permit(:email, :first_name, :last_name, :id).reject{|_, v| v.blank?}
    render json: User.find(params[:id])
  end

#   def new
#   end

#   def create
#   end

#   def edit
#   end

#   def update
#   end

#   def destroy
#   end

  private
  def not_found
    render json: {error: "not-found"}, status: 404
  end
end
