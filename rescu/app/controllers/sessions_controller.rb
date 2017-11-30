class SessionsController < ApplicationController
  before_action :save_last_login, only: [:destroy]
  
  def new
  end
  
  def create
  @user = User.find_by_email(params[:session][:email])
  if @user && @user.authenticate(params[:session][:password])
    log_in @user
    redirect_to dashboard_path
  else
    redirect_to login_url, :flash => { :error => "Invalid email/password combination" }
  end 
    
 end

  def destroy 
    log_out 
    flash[:success] = "You have been logged out"
    redirect_to root_url 
  end

  def save_last_login
    current_user.update_columns(:last_login => Time.now)
  end

end
