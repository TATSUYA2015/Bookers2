class UsersController < ApplicationController
  def index
    @book=Book.new
    @user=current_user
  end

  def show
    @user=User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
