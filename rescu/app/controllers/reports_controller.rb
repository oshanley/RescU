class ReportsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
 
  def index
    @reports = current_user.reports.all
  end 
 
  def new 
   @report = Report.new 
  end
  
  def create
    @report = current_user.reports.build(report_params) 
    if @report.save!
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
    if @report.save!
      flash[:success] = "Report updated"
      redirect_to reports_path
    else
     flash[:error] = "There was an error updating your report"
     redirect_to edit_report_path 
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
    params.require(:report).permit(:title, :description, :address, :city, :state, :country, :zipcode, :latitude, :longitude, :severity, :anonymous)
  end
end
