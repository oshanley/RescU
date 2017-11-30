=begin
Name: Olivia Shanley
Course: CSC 415
Semester: Fall 2017
Instructor: Dr. Pulimood 
Project name: RescU 
Description: An platform to help facilitate animal rescues
Filename: sessions_helper.rb
Description: Helpers for the Sessions controller
=end

module SessionsHelper

  # Logs in the given user
  def log_in(user)
    session[:user_id]= user.id
  end

  # Returns the current logged in user if there is one
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end
  
  # Logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil  
  end

  # Confirms a logged-in user
  def logged_in_user
   unless logged_in?
     store_location
     flash[:danger] = "Please log in."
     redirect_to login_url
    end
  end
end
