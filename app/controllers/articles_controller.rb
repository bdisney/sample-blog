class ArticlesController < ApplicationController

before_filter :authenticate_user!, only: [:new, :create]

before_action :set_article, only: [:edit, :show, :update, :destroy]

  
  def index
    @articles = Article.includes(:comments).order("comments.created_at desc")
    
  end

  def new
  end
  
  def create
    @article = current_user.articles.build(article_params)
    #@article.user_id = current_user.id


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
      params.require(:article).permit(:title, :text, :user_id)
    end

end
