require 'rails_helper.rb'

RSpec.describe HomeController do
  it 'should return 200 status' do
    get :index
    expect(response).to have_http_status(:ok)
  end

  it 'should render index template' do
    get :index
    expect(subject).to render_template(:index)
  end
end
