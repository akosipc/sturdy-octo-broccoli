require 'rails_helper'

RSpec.describe Post, type: :model do
  it { expect(described_class.new).to validate_presence_of :title }
  it { expect(described_class.new).to validate_presence_of :description }
  it { expect(described_class.new).to validate_length_of :description }

  describe "#something" do
    let!(:post1) do
      FactoryBot.create(:unpublished_post, title: "small title")
    end

    let!(:post2) do
      FactoryBot.build(:unpublished_post, title: "small title")
    end

    let!(:post3) do
      FactoryBot.attributes_for(:unpublished_post, title: "small title")
    end

    it "does something" do
      byebug
    end
  end
end
