class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    if @blog.valid?
      redirect_to blogs_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
