class ProjectsController < ApplicationController
    before_action :find_params, only: [:show, :edit, :update, :destroy]
	def index
		@projects = Project.all.order("created_at desc").paginate(:page => params[:page], :per_page => 2)
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
		  redirect_to @project
		else
			render 'new'
		end
	end

	def edit
	end

	def show
	end
			
	def update
		@project = Project.update(project_params)
		if @project.save
		  redirect_to  @project
		else
			render 'edit'
		end
	end
					
	def destroy
	end

	private

	def find_params	
		@project = Project.friendly.find(params[:id])	
	end

	def project_params
		params.require(:project).permit(:title, :description, :link)
	end
end
