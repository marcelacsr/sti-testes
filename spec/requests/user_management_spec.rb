require 'rails_helper'

RSpec.feature 'User Management', type: :request do
  let!(:user){ create :user }


  before { login }

  describe 'user#index' do
    it 'retorna lista de usuarios' do
      get users_path
      expect(response).to render_template :index
    end
  end



end
