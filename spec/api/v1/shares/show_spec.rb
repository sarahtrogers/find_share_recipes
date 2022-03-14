require 'rails_helper'

RSpec.describe "shares#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/shares/#{share.id}", params: params
  end

  describe 'basic fetch' do
    let!(:share) { create(:share) }

    it 'works' do
      expect(ShareResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('shares')
      expect(d.id).to eq(share.id)
    end
  end
end
