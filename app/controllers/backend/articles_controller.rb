module Backend
  class ArticlesController < BaseController
    def index
      @articles = Article.all.order(created_at: :desc)
    end
  end
end
