class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render "new", status: :unprocessable_entity
      #render -> viewsフォルダ内のnew.html.erbを表示
      #status: バリデーションエラーが起こった場合、ステータスコード422でレンダリング
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, status: :see_other
    #HTTP stutas code 303 を使用（新規リソースへの転送）
  end

  private
  def task_params
    params.require(:task).permit(:title)
  end
end

#コントローラーとviewはrailsのソースファイルに書かれた何かによってつながっている
