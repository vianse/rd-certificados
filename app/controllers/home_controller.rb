class HomeController < ApplicationController
  def index
    if cookies[:admin_id]
   
    else
      redirect_to "/"
    end
    @groups = Group.all
    if cookies[:user_id]
      redirect_to "/inbox?token=" + cookies[:user_id]
    else

    end
  end
  def out
    cookies.delete :user_id
    redirect_to "/"
  end
  def out_admin
    cookies.delete :admin_id
    redirect_to "/"
  end
end
