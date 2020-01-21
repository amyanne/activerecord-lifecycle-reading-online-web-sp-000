class PostsController < ApplicationController
  belongs_to :author
  validate :is_title_case
 
  # New Code!!
  
  before_validation :make_title_case
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(params.require(:post).permit(:title, :description))
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post).permit(:title, :description, :post_status, :author_id))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end
end
