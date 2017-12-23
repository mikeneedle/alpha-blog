class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def new
    @article = Article.new
  end
  
  def index
    @articles = Article.all
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params) #to whitelist data for entry so it can be saved
    if @article.save #if saved ok
      flash[:notice] = "Article was successfully saved" #outputs a notice to user all is well
      redirect_to article_path(@article) #after the article is saved, send the browser to show what is now in the article table
    else #issue with the save
      render 'new' #display form for user to try again
    end
  end
  
  #shows the requested article
  def show
  end
  
  def edit
  end
  
  def update
    #find the article to edit based on the form variable
    if @article.update(article_params) #command to update with whitelisted (article_params) input
      flash[:notice] = "Article was successfully saved" #outputs a notice to user all is well
      redirect_to article_path(@article) #after the article is saved, send the browser to show what is now in the article table
    else #issue with the save
      render 'edit' #display form for user to try again
    end
  end
  
  def destroy
    #find the article to edit based on the form variable
    @article.destroy #command to update with whitelisted (article_params) input
    flash[:notice] = "Article was successfully destroyed (boom sauce!)" #outputs a notice to user all is well
    redirect_to articles_path #after the article is saved, send the browser to show what is now in the article table
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
  
end
