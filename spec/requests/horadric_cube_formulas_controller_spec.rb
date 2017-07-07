RSpec.describe Api::HoradricCubeFormulasController, type: :request do

  include_context "generic context"

  describe "#index" do

    let!(:first_formula) { create(:horadric_cube_formula) }
    let!(:second_formula) { create(:horadric_cube_formula) }

    it "returns the horadric cube formulas" do
      get("/api/horadric_cube_formulas", headers: request_headers)
      expect(response_body.length).to eq(2)
      expect(response.status).to eq(200)
      expect(response_body.any? { |formula| formula[:id] == first_formula.id.to_s }).to eq(true)
      expect(response_body.any? { |formula| formula[:id] == second_formula.id.to_s }).to eq(true)
    end

  end
end