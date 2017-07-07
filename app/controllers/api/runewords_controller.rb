class Api::RunewordsController < Api::ApiController
  
  def index
    runewords = RunewordSearcher.new(search_params).results
    render json: runewords, status: :ok
  end

  private
    def search_params
      params[:search].presence || {}
    end

end