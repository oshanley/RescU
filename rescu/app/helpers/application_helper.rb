=begin
Name: Olivia Shanley
Course: CSC 415
Semester: Fall 2017
Instructor: Dr. Pulimood 
Project name: RescU 
Description: An platform to help facilitate animal rescues
Filename: application_helper.rb
Description: Helpers for the Application
=end

module ApplicationHelper

  # Returns flash notice class type for Bootstrap styling
  def flash_class(level)
    return case level
        when "notice"; "alert alert-info"
        when "success"; "alert alert-success"
        when "error"; "alert alert-danger"
        when "alert"; "alert alert-danger"
        else; "alert alert-info"
    end
  end

end
