class TasksController < ApplicationController
    
    respond_to :json

    def create
      return unless current_user.projects.ids.include?((params[:project_id]).to_i)
      @project = Project.find(params[:project_id])
      @task = @project.tasks.new(task_params)
      @task.save
    end
  
    def edit
      return unless current_user.tasks.ids.include?((params[:id]).to_i)
      @task = Task.find params[:id]
    end
  
    def update
      return unless current_user.tasks.ids.include?((params[:id]).to_i)
      @project = Project.find(params[:project_id])
      @task = Task.find(params[:id])
      @task.update(task_params)
    end
  
    def destroy
      return unless current_user.tasks.ids.include?((params[:id]).to_i)
      @project = Project.find(params[:project_id])
      @task = @project.tasks.find(params[:id])
      @task.destroy
    end
  
    private
      def task_params
        params.require(:task).permit(:name, :status, :date)
      end
end
