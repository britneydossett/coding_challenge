class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      redirect_back_or tasks_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
