class TodosController < ApplicationController

  def toggle_completed
    @task.completed = !@task.completed
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path }
        format.json { render :show, status: :ok, location: @task }
      else
        #some error message
      end
    end
  end

  # GET /tasks
  def index
    @tasks = current_customer.tasks.order(created_at: :desc)
  end

  # GET /todos/1
  def show
  end

  # GET /todos/new
  def new
    @task = Task.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  def create
    @task = task.new(task_params)
    @task.customer = current_customer

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path}
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  def update
    # respond_to do |format|
    #   if @task.update(task_params)
    #     format.html { redirect_to task_path, notice: 'Task was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @task }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to task_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :completed)
    end

    def verify_correct_customer
      @task = current_customer.tasks.find_by(id: params[:id]) #comes from the url
      redirect_to root_url, notice: 'Shame shame! That is not yours.' if @task.nil?
    end
end
