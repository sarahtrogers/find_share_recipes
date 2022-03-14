require "rails_helper"

RSpec.describe ShareResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "shares",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ShareResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Share.count }.by(1)
    end
  end

  describe "updating" do
    let!(:share) { create(:share) }

    let(:payload) do
      {
        data: {
          id: share.id.to_s,
          type: "shares",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ShareResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { share.reload.updated_at }
      # .and change { share.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:share) { create(:share) }

    let(:instance) do
      ShareResource.find(id: share.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Share.count }.by(-1)
    end
  end
end
