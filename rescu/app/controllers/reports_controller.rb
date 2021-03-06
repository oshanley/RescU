=begin
Name: Olivia Shanley
Course: CSC 415
Semester: Fall 2017
Instructor: Dr. Pulimood 
Project name: RescU 
Description: An platform to help facilitate animal rescues
Filename: reports_controller.rb
Description: Reports controller. Handles all the logic behind creating, updating, destroying, and searching/sorting.
=end

class ReportsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy] 

  def index
    if current_user.org_user
      @reports = Report.all
    else
      if params[:location].present?
        @reports = Report.near(params[:location], params[:distance], order: :distance)
      elsif params[:severity].present?
        @reports = Report.find(:all, order: :severity)
      else
        @reports = current_user.reports.all
      end
    end
  end 

  def search
    # Persist previous queries
    @prev_severity = params[:severity]
    @prev_status = params[:status]
  
    # Get reports by location and distance if specified
    if params[:location].present?
 
      if params[:distance].present?
        @reports = Report.near(params[:location], params[:distance])
        @prev_distance = params[:distance]
      else
        @reports = Report.all
      end

      @prev_location = params[:location]
    else
      # Reset distance query if no location is specified
      @prev_distance = nil
      @reports = Report.all
    end

    # Sort reports
    @reports = @reports.where("severity LIKE ?", params[:severity]) if params[:severity].present?
    @reports = @reports.where("status LIKE ?", params[:status]) if params[:status].present?
  end

  def needs_review
    @reports = @reports.where("status LIKE ?", 'Pending Review')

  end

  def dashboard
    if current_user.org_user
      @reports = Report.where("created_at >= ?", current_user.last_login)
    else
      @reports = Report.where("updated_at >= ?", current_user.last_login)
    end
  end
 
  def new 
   @report = Report.new 
  end
  
  def create
    @report = current_user.reports.build(report_params) 
    if @report.save
      flash[:success] = "Report created"
      redirect_to reports_path
    else 
      render 'new' 
    end 
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.update(report_params)
    if @report.save
      flash[:success] = "Report updated"
      if current_user.org_user
        redirect_to search_path
      else
        redirect_to reports_path
      end
    else
     flash[:error] = "There was an error updating your report"
     render 'new' 
    end
    
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    flash[:success] = "Report deleted"
    redirect_to reports_path 
  end

private
  def report_params
    params.require(:report).permit(:title, :description, :address, :city, :state, :country, :zipcode, :latitude, :longitude, :severity, :status, :anonymous)
  end
end
