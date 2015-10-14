RSpec.describe Backend::ArticlesController do
  describe "GET#index" do
    it do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET#show" do
    it do
      article = Article.create(title: 'TEST')
      get :show, id: article.id

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET#edit" do
    it do
      article = Article.create(title: 'TEST')
      get :edit, id: article.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET#new" do
    it do
      xhr :get, :new, format: :js
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT#update' do
    let(:attributes) { { 'title' => 'AFTER UPDATE', 'content' => '# title   ## subtitle' } }

    it do
      article = Article.create(title: 'TEST')
      put :update, id: article.id, article: attributes

      expect(response).to redirect_to backend_article_path(article)
      expect(article.reload.attributes.slice('title', 'content')).to eq(attributes)
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
