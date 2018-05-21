require 'rails_helper'

RSpec.describe Micropost, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'scope' do
    let(:micropost1){ create :micropost, created_at: DateTime.now-1 }
    let(:micropost2){ create :micropost, created_at: DateTime.now }
    it 'ordenado' do
      micropost1
      micropost2
      expect(Micropost.ordenado).to eq([micropost2, micropost1])
    end
  end
end