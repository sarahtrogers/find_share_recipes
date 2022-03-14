require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:photo) }

    it { should validate_presence_of(:user_id) }

    end
end
