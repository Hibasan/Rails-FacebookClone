class BlogsController < ApplicationController

  def new
    @blog = Blog.new
    @user =User.find(current_user.id)
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    # Blog.create(params.require(:blog).permit(:content))
    @blog.save(blog_params)
    redirect_to user_path(current_user.id)
  end

  def index
    p "◆◆blogs_index◆◆"
    @blogs = Blog.all
    @user =User.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
    @user =User.find(current_user.id)
  end

  def update
    def update
      @blog = Blog.find(params[:id])
      if @blog.update(blog_params)
        redirect_to user_path(current_user.id), notice: "ブログを編集しました！"
      else
        render :edit
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to user_path(current_user.id), notice:"ブログを削除しました！"
  end

  private
  def blog_params
    params.require(:blog).permit(:content)
  end

end
