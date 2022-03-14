require "rails_helper"

RSpec.describe "shares#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/shares", params: params
  end

  describe "basic fetch" do
    let!(:share1) { create(:share) }
    let!(:share2) { create(:share) }

    it "works" do
      expect(ShareResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["shares"])
      expect(d.map(&:id)).to match_array([share1.id, share2.id])
    end
  end
end
