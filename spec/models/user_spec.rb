require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }
  subject { user }

  # it 'has a valid factory' do
  #   expect(FactoryBot.build(:user)).to be_valid
  #   #TODO https://robots.thoughtbot.com/testing-your-factories-first
  # end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    # it { is_expected.to validate_uniqueness_of(:email) } return nil??

    describe 'email_valido' do
      it 'deveria ser valido' do
        user = build :user
        expect(user).to be_valid
      end
      it 'deveria ser invalido' do
        user = build :user, email: 'email_invalido'
        expect(user).to_not be_valid
      end
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:microposts) }
    it { is_expected.to have_many(:received_notifications) }
    it { is_expected.to have_many(:active_relationships) }
    it { is_expected.to have_many(:passive_relationships) }
  end

  describe 'methods' do
    # TODO
    describe '.autenticado?' do
      it 'É verdadeiro quando digest for nulo' do
        # expect(user.authenticated?).to be true
      end
      it 'É falso quando digest for nulo' do
# build :user, remember_digest:
# expect(user.authenticated?).to be false
      end
    end
    describe 'usuario_ativo' do
      let!(:user_desativado) { create :user, activated: false }
      it 'retorna o email ativo do usuario' do
        expect(user_desativado.activate).to be_truthy
      end
    end
    describe 'email lower-case' do
      let!(:user) { create :user, email: 'Sti_TeStE@teste.com' }
      it 'retorna o email lower-case' do
        expect(user.email).to eq('sti_teste@teste.com')
        # expect(user.save).to be_truthy Qual dos dois?
      end
    end
  end
end
