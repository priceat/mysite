class BlogsController < ApplicationController
  layout  "layouts/blog"
  SLUGS = {
    'a-student-review-of-bloc-io-and-the-firehose-project' => [1, "Why the Firehose Project Beats Bloc.io", "June 1st, 2015"]
  }
  def index
    @blogs = Blog.all
  end

  def show
    @post_id = SLUGS[params[:id]].try(:first) || params[:id]
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
