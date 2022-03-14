require 'rails_helper'

RSpec.describe "shares#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/shares", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'shares',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ShareResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Share.count }.by(1)
    end
  end
end
