RSpec.describe Api::GameGemsController, type: :request do

  include_context "generic context"

  describe "#index" do

    let!(:topaz) { create(:game_gem, :topaz, :chipped) }
    let!(:sapphire) { create(:game_gem, :sapphire, :flawed) }

    it "returns the gems" do
      get("/api/game_gems", headers: request_headers)
      expect(response_body.length).to eq(2)
      expect(response.status).to eq(200)
      expect(response_body.any? { |a_gem| a_gem[:id] == topaz.id.to_s }).to eq(true)
      expect(response_body.any? { |a_gem| a_gem[:id] == sapphire.id.to_s }).to eq(true)
    end

  end
end