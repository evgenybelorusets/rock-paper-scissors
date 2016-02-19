require 'rails_helper'

RSpec.describe ThrowsController do
  describe '#create' do
    it 'should respond with success status if no errors happened' do
      post :create, sign: 'paper'
      expect(response).to have_http_status(:ok)
    end

    it 'should render create template if no errors happened' do
      post :create, sign: 'rock'
      expect(subject).to render_template(:create)
    end

    it 'should redirect to if invalid sign is sent' do
      post :create, sign: 'Spock'
      expect(subject).to redirect_to(root_url)
    end
  end
end
