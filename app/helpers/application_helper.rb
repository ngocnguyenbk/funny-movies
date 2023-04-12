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

  def truncate_words(text, length = 30, end_string = '...')
    words = text.split
    words[0...length].join(' ') + (words.length > length ? end_string : '')
  end
end
