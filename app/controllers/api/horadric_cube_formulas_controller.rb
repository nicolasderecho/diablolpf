class Api::HoradricCubeFormulasController < Api::ApiController
  
  def index
    formulas = HoradricCubeFormulaSearch.new(search_params).results
    render json: formulas, status: :ok
  end


  private
    def search_params
      params[:search].presence || {}
    end

end