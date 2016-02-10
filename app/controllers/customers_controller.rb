class CustomersController < ApplicationController
  # before_action :set_customer, only: [:show, :edit, :update, :destroy]
  # before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  # before_action :verify_correct_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @customers = Customer.all
  end

  # GET /users/1
  def show
    @task = Task.new
    @customer = current_customer
    @tasks = Customer.find(@customer).tasks
  end

  def

  # GET /users/new
  def new
    @customer = Customer.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
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

  # PATCH/PUT /users/1
  def update
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name,
                             :email,
                             :phone )
    end

    def verify_correct_customer
      customer = customer.find_by(id: params[:id])
      redirect_to root_url unless current_customer?(customer)
    end
end

