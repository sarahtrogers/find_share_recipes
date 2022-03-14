require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:ratings) }

    it { should have_many(:comments) }

    it { should have_many(:recipes) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:first_name) }

    it { should validate_presence_of(:last_name) }

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }

    end
end
