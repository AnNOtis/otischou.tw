RSpec.describe Backend::ArticlesController do
  describe "GET#index" do
    it do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET#new" do
    it do
      xhr :get, :new, format: :js
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST#create" do
    it do
      post :create, article: { title: 'NEW ARTICLE' }
      expect(response).to redirect_to backend_articles_path
      expect(Article.count).to eq(1)
    end
  end

  describe "DELETE#destroy" do
    it do
      article = Article.create(title: "ARTICLE")
      delete :destroy, id: article.id

      expect(response).to redirect_to backend_articles_path
      expect(Article.count).to eq(0)
    end
  end

  describe "POST#publish" do
    it do
      article = Article.create(title: "ARTICLE")
      xhr :post, :publish, format: :js, id: article.id

      expect(response).to have_http_status(:success)
      expect(article.reload.status).to eq("publish")
    end
  end

  describe "GET#unpublish" do
    it do
      article = Article.create(title: "ARTICLE")
      xhr :post, :unpublish, format: :js, id: article.id

      expect(response).to have_http_status(:success)
      expect(article.reload.status).to eq("draft")
    end
  end

end
