class TasksController < ApplicationController
    
    respond_to :json

    def create
      @project = Project.find(params[:project_id])
      @task = @project.tasks.new(task_params)
      @task.save
    end
  
    def edit
      @task = Task.find params[:id]
    end
  
    def update
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:id])
      @task.update(task_params)
    end
  
    def destroy
      @project = Project.find(params[:project_id])
      @task = @project.tasks.find(params[:id])
      @task.destroy
    end
  
    private
      def task_params
        params.require(:task).permit(:name, :status)
      end
end
