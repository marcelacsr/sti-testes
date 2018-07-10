require 'rails_helper'

RSpec.describe Relationship, type: :model do
  # let(:relationship) { Relationship.new }
  let(:relationship) { create :relationship }

  it 'should be valid' do
    expect(relationship).to be_valid
  end

  describe 'associations' do
    it{ is_expected.to belong_to(:follower) }
    it{ is_expected.to belong_to(:followed) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:followed_id) }
    it { is_expected.to validate_presence_of(:follower_id) }
  end
end
