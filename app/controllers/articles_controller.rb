class ArticlesController < ApplicationController

before_action :set_article, only: [:edit, :updaate]
  
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

  #def update 
  #  respond_to do |format|
  #    if @article.update(article_params)
  #      redirect_to @article, notice: 'Article was successfully update.'
  #      render :show, status: created, location:@article
  #    else
  #      render :new
  #    end
  #  end
  #end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
