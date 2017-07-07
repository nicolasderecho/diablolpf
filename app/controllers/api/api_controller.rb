class Api::ApiController < ApplicationController

  before_action :parse_search_params

  def heartbeat
    render json: {}, status: :ok
  end

  def parse_search_params
    params[:search]= JSON.parse(params[:search]) if params[:search].is_a?(String)
  end

end