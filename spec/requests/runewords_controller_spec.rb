RSpec.describe Api::RunewordsController, type: :request do

  include_context "generic context"

  describe "#index" do

    let!(:first_runeword)  { create(:runeword, code: 'spirit') }
    let!(:second_runeword) { create(:runeword, code: 'steel') }

    it "returns the runewords" do
      get("/api/runewords", headers: request_headers)
      expect(response_body.length).to eq(2)
      expect(response.status).to eq(200)
      expect(response_body.any? { |rune| rune[:id] == first_runeword.id.to_s }).to eq(true)
      expect(response_body.any? { |rune| rune[:id] == second_runeword.id.to_s }).to eq(true)
    end

  end
end