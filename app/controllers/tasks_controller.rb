class TasksController < ApplicationController

  def toggle_completed
    puts @task.completed
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

  def index
    @tasks = Customer.find(current_customer).tasks.order(created_at: :desc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    # @task.customer = current_customer
    customer = Customer.find(@task.customer_id)

    respond_to do |format|
      if @task.save
        format.html { redirect_to customer_path(customer)}
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :completed, :customer_id)
    end

    def verify_correct_customer
      @task = current_customer.tasks.find_by(id: params[:id])
      redirect_to root_url, notice: 'Shame shame! That is not yours.' if @task.nil?
    end
end
