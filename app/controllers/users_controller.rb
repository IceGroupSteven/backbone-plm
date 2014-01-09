class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up!"
      
      respond_to do |format|
        format.html { redirect_to @user}
        format.json { render :json => @user }
        # TODO: change @user to the techpack path...
      end
    else
      # if @user is not valid, it will be rendered with errors
      respond_to do |format|
        format.html { render :json => @user.errors }
        format.json { render :json => @user }
      end
    end

  end

  def update
    # TODO: the 2nd part of new user signup will effectively update our existing, basic user
    @user = User.find_by(session[:user_id])
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :company)
  end
end
