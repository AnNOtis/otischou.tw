RSpec.describe ArticlesController do
  describe 'GET#index' do
    it do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
