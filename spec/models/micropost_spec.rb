require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:micropost) { Micropost.new }

  describe 'associations' do

    it{ is_expected.to belong_to(:user) }
    # it{ is_expected.to have_one(:gestor_recurso).through(:pedido).
    # class_name('Usuario').with_foreign_key('usuario_id').source(:usuario) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'scope' do
    let!(:micropost1){ create :micropost, created_at: DateTime.now-1 }
    let!(:micropost2){ create :micropost, created_at: DateTime.now }
    it 'ordenado' do
      micropost1
      micropost2
      expect(Micropost.ordenado).to eq([micropost2, micropost1])
    end
  end
end