class Api::V1::UsersController < ApplicationController
  def create
    @user = User.create!(user_params)
    users_images = @user.as_json.merge(
      image_urls: @user.images.attached? ? @user.images.map { |image| url_for(image) } : []
    )
    render json: users_images
  end

  def show
    @user = User.find(params[:id])

    users_images = @user.as_json.merge(
      image_urls: @user.images.attached? ? @user.images.map { |image| url_for(image) } : []
    )
    render json: users_images
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :uuid,
      images: []
    )
  end
end
