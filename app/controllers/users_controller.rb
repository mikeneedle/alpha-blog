class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save #if saved ok
      flash[:notice] = "User account successfully created" #outputs a notice to user all is well
      redirect_to articles_path #after the user is created send them to article main page
    else #issue with the save
      render 'new' #display form for user to try again
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your details were updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  private def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end
