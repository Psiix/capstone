class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
 #  before_action :logged_in_user, only: [:create, :destroy]
 #  before_action :correct_user,   only: :destroy

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /tasks/new
  def new
    @project = current_user.projects.where('id = ?', current_user.projects.ids)
    #@task = Task.new(:project_id => params[:project_id])
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "task created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def complete
  end
    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:content, :project_id)
    end
    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to root_url if @task.nil?
    end
end
