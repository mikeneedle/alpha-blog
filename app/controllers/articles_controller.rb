class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]  
  
  def new
    @article = Article.new
  end
  
  def index
    #@articles = Article.all # commented out to do pagination
    #below will incorporate pagination at 5 per view
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params) #to whitelist data for entry so it can be saved
    @article.user = current_user
    if @article.save #if saved ok
      flash[:success] = "Article was successfully saved" #outputs a notice to user all is well
      redirect_to article_path(@article) #after the article is saved, send the browser to show what is now in the article table
    else #issue with the save
      render 'new' #display form for user to try again
    end
  end
  
  #shows the requested article
  def show
    @article = Article.find(params[:id])
    #@articles = @article.paginate(page: params[:page], per_page: 5)
  end
  
  def edit
  end
  
  def update
    #find the article to edit based on the form variable
    if @article.update(article_params) #command to update with whitelisted (article_params) input
      flash[:success] = "Article was successfully saved" #outputs a notice to user all is well
      redirect_to article_path(@article) #after the article is saved, send the browser to show what is now in the article table
    else #issue with the save
      render 'edit' #display form for user to try again
    end
  end
  
  def destroy
    #find the article to edit based on the form variable
    @article.destroy #command to update with whitelisted (article_params) input
    flash[:success] = "Article was successfully destroyed (boom sauce!)" #outputs a notice to user all is well
    redirect_to articles_path #after the article is saved, send the browser to show what is now in the article table
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end
end
