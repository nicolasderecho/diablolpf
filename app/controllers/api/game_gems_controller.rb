class Api::GameGemsController < Api::ApiController
  
  def index
    gems = GameGemSearch.new(search_params).results
    render json: gems, status: :ok
  end

  def gem_types
    render json: GameGem.types, status: :ok
  end

  private
    def search_params
      params[:search].presence || {}
    end

end
