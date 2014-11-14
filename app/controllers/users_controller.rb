class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end


  def follow
    @user = User.find(params[:user])
    current_user.follow!(@user)
  end
  def unfollow
    @user = User.find(params[:user])
    current_user.unfollow!(@user)
  end
end
