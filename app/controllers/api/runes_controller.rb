class Api::RunesController < Api::ApiController
  
  def index
    runes = RuneSearcher.new(search_params).results
    render json: runes, status: :ok
  end

  private
    def search_params
      params[:search].presence || {}
    end

end
