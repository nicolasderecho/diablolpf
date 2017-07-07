RSpec.describe Api::RunesController, type: :request do

  include_context "generic context"

  describe "#index" do

    let!(:zod) { create(:rune, :zod) }
    let!(:tal) { create(:rune, :tal) }

    it "returns the runes" do
      get("/api/runes", headers: request_headers)
      expect(response_body.length).to eq(2)
      expect(response.status).to eq(200)
      expect(response_body.any? { |rune| rune[:id] == zod.id.to_s }).to eq(true)
      expect(response_body.any? { |rune| rune[:id] == tal.id.to_s }).to eq(true)
    end

  end
end