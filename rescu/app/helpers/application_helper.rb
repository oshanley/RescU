module ApplicationHelper

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
