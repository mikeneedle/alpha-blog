class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    article = Article.new(article_params) #to whitelist data for entry so it can be saved
    article.save #save the data to the database
    redirect_to articles_show_(@article) #after the article is saved, send the browser to show what is now in the article table
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end
