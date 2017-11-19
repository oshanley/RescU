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
      redirect_to '/'
    else 
      render 'new' 
    end 
  end

  def destroy
    #@report = current_user.reports.find(params[:id])
    @report = Report.find(params[:id])
    @report.destroy

    redirect_to user_reports_path, notice: "Delete success"
  end

private
  def report_params
    params.require(:report).permit(:title, :description, :address, :town, :state, :zipcode, :severity, :anonymous)
  end
end
