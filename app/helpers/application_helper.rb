module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def flash_class(level)
    case level
    when "notice" then "alert alert-dismissible alert-success"
    when "alert" then "alert alert-dismissible alert-danger"
    else "alert alert-dismissible alert-#{level}"
    end
  end
end
