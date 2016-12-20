class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def new
  end
  
  def create
    @article = Article.new(article_params)  
    if @article.valid?
      @article.save
    else
      render action: 'new'
    end 
  end

  def edit
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end



end
