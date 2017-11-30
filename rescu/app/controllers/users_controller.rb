=begin
Name: Olivia Shanley
Course: CSC 415
Semester: Fall 2017
Instructor: Dr. Pulimood 
Project name: RescU 
Description: An platform to help facilitate animal rescues
Filename: users_controller.rb
Description: Users controller. Handles creating, editing, and destroying users.
=end

class UsersController < ApplicationController
  include SessionsHelper
 
  def show
    @user = User.find(params[:id])
    @reports = @user.reports
  end  

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) 
    if @user.save
      log_in(@user)
      redirect_to '/'
    else 
      render :new
    end 
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :org_user)
  end
end
