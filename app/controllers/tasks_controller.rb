class TasksController < ApplicationController

  def complete
     @task = Task.find(current_customer)
     @task.completed = true
     @task.save
     redirect_to customer_path(Task.find(current_customer).customer_id)
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
    # customer = Customer.find(@task.customer_id)

    respond_to do |format|
      if @task.save
        format.html { redirect_to customer_path(1) }
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

    def task_params
      params.require(:task).permit(:description, :completed, :customer_id)
    end

end
