class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user, :flash_class
  include SessionsHelper, ApplicationHelper

end
