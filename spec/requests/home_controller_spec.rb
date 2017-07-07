RSpec.describe HomeController, type: :request do

  include_context "generic context"

  describe "#index" do
    it "returns status ok if the server is running" do
      get("/")
      expect(response.status).to eq(200)
    end
  end

end