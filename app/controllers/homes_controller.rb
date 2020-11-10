class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :check_auth

  def index
  end

def check_auth
    if user_signed_in?
      render :index
    else user_signed_in?
        render :layout => 'splash'
    end
  end
end
