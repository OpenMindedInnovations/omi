class BlogsController < ApplicationController
  before_filter :get_blog, :only => [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @blogs = Blog.tagged_with(params[:tag])
    else
      @blogs = Blog.all
    end
  end

  def new
    @blog = Blog.new
  end

  def show
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to root_path
    else
      redirect_to new_blogs_path
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: 'Blog was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to root_path, notice: 'Blog was successfully destroyed.'
  end

  private
    def blog_params
      params.require(:blog).permit(
        :title,
        :content,
        :embed_id,
        :tag_list
      )
    end

    def get_blog
      @blog = Blog.find(params[:id])
    end
end
