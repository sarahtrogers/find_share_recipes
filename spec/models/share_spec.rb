require 'rails_helper'

RSpec.describe Share, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:recipe_id) }

    it { should validate_presence_of(:recipient_id) }

    end
end
