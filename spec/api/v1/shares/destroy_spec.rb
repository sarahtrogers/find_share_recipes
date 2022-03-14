require "rails_helper"

RSpec.describe "shares#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/shares/#{share.id}"
  end

  describe "basic destroy" do
    let!(:share) { create(:share) }

    it "updates the resource" do
      expect(ShareResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Share.count }.by(-1)
      expect { share.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
