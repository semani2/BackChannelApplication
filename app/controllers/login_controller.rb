class LoginController < ApplicationController


    def login
      @flag = 0
      if user = User.authenticate(params[:username],params[:password])
        session[:user] = user
        @flag = 0
        @user_type = user.usertype
        session[:user_type] = @user_type
        flash[:notice] = "Login successful"
        if(@user_type == 'user')
        redirect_to :controller => 'posts', :action => 'index'
        else
        redirect_to :controller => 'admin' , :action => 'admin_home'
        end


    else
      if(params[:username]==nil && params[:password]==nil)
      else
      flash[:notice] = "Login unsuccessful"

       end
      end
    end
    def show

    end
  def remove
    session.delete(:user)
    session.delete(:user_type)
    redirect_to :controller => 'posts' , :action => 'index'
  end


end
