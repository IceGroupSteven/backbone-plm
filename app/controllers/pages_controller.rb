class PagesController < ApplicationController
  def home
    @user = User.new
  end

  def about
  end

  def contact
  end

  def terms
  end
end
