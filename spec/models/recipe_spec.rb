require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:category) }

    it { should have_many(:shares) }

    it { should have_many(:ratings) }

    it { should have_many(:comments) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:category_id) }

    it { should validate_presence_of(:dietary_restrictions) }

    it { should validate_presence_of(:ingredients) }

    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:photo) }

    it { should validate_presence_of(:user_id) }

    end
end
