require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    let!(:user) { FactoryBot.create(:user) }
    it "can be created" do
      expect(user).to be_valid
    end
  end

  describe "validations" do
    let(:user) { FactoryBot.build(:user) }
    let(:duplicate_user) { FactoryBot.build(:user) }
    it "must have an email address" do
      user.email = nil
      expect(user).to_not be_valid
    end
    it "must have a unique email address" do
      user.save!
      duplicate_user.email = user.email
      expect(duplicate_user).to_not be_valid
    end
    it "must have a password" do
      user.password = nil
      expect(user).to_not be_valid
    end
  end
  describe "user_file associations" do
    let!(:user_with_files) { FactoryBot.create(:user_with_files) }
    it "has many user files" do
      relation = described_class.reflect_on_association(:user_files)
      expect(relation.macro).to eq(:has_many)
    end
    it "destroys associated user files" do
      expect{ user_with_files.destroy }.to change { UserFile.count }.by(-5)
    end
  end

end
