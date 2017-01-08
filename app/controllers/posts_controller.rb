class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy ] 
	#render List of Post
	def index
	end

	# render New Form Title and Content 
	def new	
		@post = Post.new
	end

	# Actually create row in DataBase and save to it 
	def create
		@post = Post.new post_params
		if @post.save
			redirect_to @post, notice: "Hello Shoaib You are article is created"
		else
			render 'new', notice: "Oh not I unable to save your post"
		end
	end

	# Show each Individual Page
	def show
	end

	# Show each Edit Page
	def edit
	end

	# Show Update Page
	def update
	  if @post.update post_params
	  	redirect_to @post, notice: "Post is Edited"
	  else
	  	render 'edit'
	  end
	end

	# Delete Post
	def destroy
		@post.destroy
		redirect_to post_path
	end


	private
	# this is function allow which content to pass
	def post_params
		params.require(:post).permit(:title, :content)
	end

	#this function find Post by its ID
	def find_post
		@post = Post.find(params[:id])
	end
end
