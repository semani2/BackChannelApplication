class AdminController < ApplicationController
  def users
  end

  def posts
  end

  def add_admin
  end

  def view_admin

  end

  def add_category
    @c = Category.new
    @c.category_name = params[:category_name]
    if @c.save
      redirect_to :controller => 'admin', :action => 'view_category'
     end
  end

  def view_category

  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @admin = User.new
    @admin.name = 'Admins'
    @admin.username= params[:username]
    @admin.password = params[:password]
    @admin.usertype= 'admin'
    @admin.save

    redirect_to :controller => 'admin', :action => 'view_admin'
  end


  def view_admin

  end
  def delete_admin
    @admin = User.find(params[:id])
    if(@admin == session[:user])
      session.delete(:user)
      session.delete(:user_type)
      @admin.destroy
    else
      @admin.destroy
    end


    redirect_to :controller => 'admin' , :action => 'view_admin'
  end

  def delete_post
    @post = Post.find(params[:id])
    @post.destroy
    # deleteing tags
    @t = Tag.find_by_post_id(params[:id])
    @t.each do |tag|
      tag.destroy
      tag.save
    end
    redirect_to :controller => 'admin' , :action => 'posts'
  end

  def delete_user
    @user = User.find(params[:id])
    # Changing user id of posts with 0
    @p = Post.find_all_by_user_id(@user.id)
    @p.each do |post|

          post.user_id = 9999
          post.save
    end
    @c = Comment.find_all_by_user_id(@user.id)
    @c.each do |comment|
        comment.user_id = 9999
        comment.save
    end
    @user.destroy
    redirect_to :controller => 'admin' , :action => 'users'
  end

  def user_impersonate
    @user = User.find_by_username(params[:username])
    if @user != nil
      session[:admin_impersonate] = session[:user]
      session[:admin_type] = session[:user_type]
      session.delete(:user)
      session.delete(:user_type)
      session[:user] = @user
      session[:impersonate] = 'true'
      session[:user_type] = @user.usertype
      if(@user.usertype == 'user')
        redirect_to :controller => 'posts' ,:action => 'index'
      else
        redirect_to :controller => 'admin' ,:action => 'admin_home'
      end
    end


  end

  def stop_impersonate
    session.delete(:user)
    session.delete(:user_type)
    session[:user] = session[:admin_impersonate]
    session[:user_type] = session[:admin_type]
    session[:impersonate] = 'false'
    if(session[:user_type] == 'user')
      redirect_to :controller => 'posts' ,:action => 'index'
    else
      redirect_to :controller => 'admin' ,:action => 'admin_home'
    end


  end


 # def edit_admin
  #    @admin = User.find(params[:id])
  #    @admin.username = params[:username]
   #   @admin.password = params[:password]
   #   @admin.save
  # redirect_to :controller => 'admin' , :action => 'edit_admin' , :id => params[:id]
 # end

end
