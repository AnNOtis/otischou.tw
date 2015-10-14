RSpec.describe ArticlesController do
  describe 'GET#index' do
    it do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET#show' do
    it do
      article = Article.create(title: 'YO')
      get :show, id: article
      expect(response).to have_http_status(:success)
    end
  end
end
