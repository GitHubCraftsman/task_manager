class ProjectsController < ApplicationController
    
    respond_to :json

    def index
      @projects = Project.all
    end
  
    def show
      @project = Project.find params[:id]
      @task = Task.new
    end
  
    def new
      @project = Project.new
    end
  
    def edit
      @project = Project.find(params[:id])
    end
  
    def create
      @project = Project.new(project_params)
      @task = Task.new
      @project.save
    end
  
    def update
      @project = Project.find(params[:id])
      @project.update(project_params)
    end
  
    def destroy
      @project = Project.find(params[:id])
      @project.destroy
    end
  
    private
    def project_params
      params.require(:project).permit(:name).merge(user: current_user)
    end
end
