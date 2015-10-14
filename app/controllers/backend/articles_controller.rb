module Backend
  class ArticlesController < BaseController
    before_action :set_article, only: %i(show update edit destroy publish unpublish)

    def index
      @articles = Article.all.order(created_at: :desc)
    end

    def edit
    end

    def update
      if @article.update(article_params)
        redirect_to backend_article_path(@article)
      else
        render :edit
      end
    end

    def show
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        redirect_to backend_articles_path, notice: %(Create [#{@article.title}])
      else
        redirect_to backend_articles_path, alert: @article.errors.full_messages.to_sentence
      end
    end

    def destroy
      @article.destroy

      redirect_to backend_articles_path
    end

    def publish
      @article.publish
    end

    def unpublish
      @article.unpublish
    end

    private

    def article_params
      params.require(:article).permit(:title, :content)
    end

    def set_article
      @article = Article.friendly.find(params[:id])
    end
  end
end
