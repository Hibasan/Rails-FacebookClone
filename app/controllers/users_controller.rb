class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'アカウントを作成しました'
      redirect_to new_session_path
    else
      render :new
    end
  end

  def show
    p "◆◆user_show◆◆"
    @user =User.find(params[:id])
    p "◆◆@user.id◆◆"
    p @user.id
    p session[:user_id]
    @blogs = @user.blogs.all
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end

end
