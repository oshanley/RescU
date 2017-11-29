class SessionsController < ApplicationController
  def new
  end
  
  def create
  @user = User.find_by_email(params[:session][:email])
  if @user && @user.authenticate(params[:session][:password])
    log_in @user
    @user.update_columns(:last_login => Time.now)
    redirect_to '/'
  else
    redirect_to login_url, :flash => { :error => "Invalid email/password combination" }
  end 
    
 end

  def destroy 
    log_out
    flash[:success] = "You have been logged out"
    redirect_to root_url 
  end
end
