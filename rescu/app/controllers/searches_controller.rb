class SearchesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  
  def index
  end

  def show
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

end
