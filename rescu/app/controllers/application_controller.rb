=begin
Name: Olivia Shanley
Course: CSC 415
Semester: Fall 2017
Instructor: Dr. Pulimood 
Project name: RescU 
Description: An platform to help facilitate animal rescues
Filename: application_controller.rb
Description: Controller for the Application
=end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user, :flash_class
  include SessionsHelper, ApplicationHelper

end
