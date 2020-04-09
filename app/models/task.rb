class Task < ApplicationRecord
    belongs_to :project
    validates :name, presence: true,
                      length: { minimum: 1 }
    validates :status, inclusion: { in: %w(new in_process now later done),
      message: "%{value} is not a valid status" }
  
     # scope :statuses, -> { Task.joins(:project).where("projects.user_id = @current_user").select(:status).distinct.order(status: :asc) }
     # scope :statuses, -> { Task.select(:status).distinct.where("projects.user_id = @current_user").order(status: :asc) }
 # scope :statuses, -> { Task.joins(:project).group("tasks.status").having("projects.user_id = @current_user").select(:status)  }    
      scope :statuses, -> { Task.select(:status).distinct.order(status: :asc) }
      scope :count_tasks, -> { Task.joins(:project).group("projects.id").select('projects.name, COUNT(*) as cnt').order("cnt DESC")  }
      scope :count_tasks_name, -> { Task.joins(:project).group("projects.id").order("projects.name ASC").select('projects.name, COUNT(*) as cnt') }
      scope :tasks_n, -> { Task.where("tasks.name LIKE ?",'N%')  }
      scope :projects_a, -> { Task.joins(:project).group("projects.id").select('projects.name, COUNT(tasks.id) as cnt').where("projects.name LIKE ?",'%a%')  }
      scope :tasks_dup, -> { Task.select(:name).group(:name).order(name: :asc).having("count(*) > 1")  }
      scope :tasks_garage, -> { Task.joins(:project).where("projects.name = 'GARAGE'").group("tasks.name, tasks.status").having("COUNT(*)>1").order("COUNT(tasks.name) DESC")  }
      scope :tasks_ten_done, -> { Task.joins(:project).where("tasks.status = 'done'").group("projects.id, projects.name").having("COUNT(*)>10").select("projects.id, projects.name, COUNT(*)").order("projects.id ASC")  }
  end
