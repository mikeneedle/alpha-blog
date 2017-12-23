class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def index
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
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end
