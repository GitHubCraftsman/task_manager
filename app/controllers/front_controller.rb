class FrontController < ApplicationController

    before_action :authenticate_user!

  respond_to :json

  


  def index
	
    @projects = Project.where("user_id = ?", current_user)
    @project = Project.new
    @task = Task.new

    
  end

  def all_projects
      @projects = Project.all
  end

  def filter
    @filter = current_user.tasks.statuses.uniq if params['f'] == 'statuses'
    @filter = current_user.tasks.count_tasks if params['f'] == 'count-tasks'
    @filter = current_user.tasks.count_tasks_name if params['f'] == 'count-tasks-order-name'
    @filter = current_user.tasks.tasks_n if params['f'] == 'tasks-n'
    @filter = current_user.tasks.projects_a if params['f'] == 'projects-a'
    @filter = current_user.tasks.tasks_dup if params['f'] == 'tasks-dup'
    @filter = current_user.tasks.tasks_garage if params['f'] == 'tasks-garage'
    @filter = current_user.tasks.tasks_ten_done if params['f'] == 'tasks-ten-done'

    respond_to do |format|
      format.json { render :json=>@filter }
    end
  end

end
