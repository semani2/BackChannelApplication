class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    if session[:user] == nil
      redirect_to :controller => 'login' ,  :action =>'login'
    else
      @users = User.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @users }
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.usertype = 'user'

     @user.save
        redirect_to :controller => 'login' , :action => 'login'


  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    session.delete(:user)
    session.delete(:user_type)
    @p = Post.all
    @p.each do |post|
      if post.user_id == @user.id
        post.user_id = 9999
        post.save
      end
    end
    @c = Comment.find_all_by_user_id(@user.id)
    @c.each do |comment|
      comment.user_id = 9999
      comment.save
    end
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
