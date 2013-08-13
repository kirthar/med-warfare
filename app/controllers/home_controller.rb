class HomeController < ApplicationController
  layout 'home'
  def index
    if user_signed_in?
      redirect_to units_path
    end
  end
end
