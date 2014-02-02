class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      if request.xhr?
        render partial: "questionnaire", object: @user, as: 'user'
      else
        redirect_to @user
      end

    else
      # If @user is not valid, the new user form will be rendered with errors
      render partial: "shared/messages", object: @user, as: 'object'
    end
  end

  def update
    # TODO: the 2nd part of new user signup will effectively update our existing, basic user
    @user = User.find_by(session[:user_id])
    # flash[:notice] = "Thank you for signing up!"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :company)
  end
end
