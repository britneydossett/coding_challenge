class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @task = Task.new
    @customer = current_customer
    @tasks = Customer.find(@customer).tasks
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  private
    def customer_params
      params.require(:customer).permit(:name,
                             :email,
                             :phone )
    end

    def new_customer
      respond_to do |format|
        format.html
        format.js
      end
    end
end

