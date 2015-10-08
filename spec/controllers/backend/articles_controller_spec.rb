RSpec.describe Backend::ArticlesController do
  context "GET#index" do
    it do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
