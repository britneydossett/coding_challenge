class ApplicationController < ActionController::Base
  layout Proc.new { |controller| controller.request.xhr? ? nil : 'application' }

  protect_from_forgery with: :exception

  def current_customer
    params[:id]
  end
end
