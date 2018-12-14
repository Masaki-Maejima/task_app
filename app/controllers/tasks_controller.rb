class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end


  def create
    @task = Task.new(task_params)
    #@task = Task.new(title: params[:task][:title], content: params[:task][:content])

    if @task.save
    redirect_to tasks_url
    else
      render :new
    end
  end


  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_param)
      redirect_to tasks_path
    else
      render :edit
    end
end

  private
  def tasks_param
    params.require(:task).permit(:title,:content)
  end
end
