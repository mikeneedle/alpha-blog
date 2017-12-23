class ArticlesController < ApplicationController
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
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    #find the article to edit based on the form variable
    @article = Article.find(params[:id])
    if @article.update(article_params) #command to update with whitelisted (article_params) input
      flash[:notice] = "Article was successfully saved" #outputs a notice to user all is well
      redirect_to article_path(@article) #after the article is saved, send the browser to show what is now in the article table
    else #issue with the save
      render 'edit' #display form for user to try again
    end
  end
  
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end
