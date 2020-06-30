class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html {redirect_to article_path(@article)}
      else
        format.html {render "new"}
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html {redirect_to article_path(@article.id)}
      else
        format.html {render "edit"}
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
def article_params
    params[:article].permit(:id, :title, :description)
  end

end
