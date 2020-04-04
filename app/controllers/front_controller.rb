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
    @filter = Task.statuses.uniq if params['f'] == 'statuses'
    @filter = Task.count_tasks if params['f'] == 'count-tasks'
    @filter = Task.count_tasks_name if params['f'] == 'count-tasks-order-name'
    @filter = Task.tasks_n if params['f'] == 'tasks-n'
    @filter = Task.projects_a if params['f'] == 'projects-a'
    @filter = Task.tasks_dup if params['f'] == 'tasks-dup'
    @filter = Task.tasks_garage if params['f'] == 'tasks-garage'
    @filter = Task.tasks_ten_done if params['f'] == 'tasks-ten-done'

    respond_to do |format|
      format.json { render :json=>@filter }
    end
  end

end
