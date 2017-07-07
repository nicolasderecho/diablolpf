class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception

  before_action :cors_preflight_check
  after_action  :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PATCH, PUT, HEAD, DELETE'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PATCH, PUT, HEAD, DELETE'
      headers['Access-Control-Allow-Headers'] = '*'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end

end