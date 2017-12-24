class UsersController < ApplicationController
  #before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def new
    @user = User.new
  end
  
  def create
  end
  
  #shows the requested article
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  

  
end
