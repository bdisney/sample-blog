class ArticlesController < ApplicationController

before_action :set_article, only: [:edit, :show, :update, :destroy]
  
  def index
    @articles = Article.order('updated_at DESC') 
  end

  def new
  end
  
  def create
    @article = Article.new(article_params)  
    if @article.save
      redirect_to @article
    else
      render :new
    end 
  end

  def show    
  end

  def edit
  end

  def update 
      if @article.update(article_params)
        redirect_to @article
      else
        render action: 'edit'
      end
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end

end
