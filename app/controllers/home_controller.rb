class HomeController < ApplicationController

  def index
    render json: {}, status: :ok
  end

  def angular_templates
    render params[:path], layout: false
  end

end