class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.find(:all , :order => 'created_at desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @flag = 0
    if(Post.find(params[:id]).user_id == session[:user].id)
    @post = Post.find(params[:id])
    params[:Tags] =  Tag.find_all_by_post_id(@post.id)
    else
      @flag = 1
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user_id = session[:user].id
    respond_to do |format|
      if @post.save
        @postvote = PostVote.new()
        @postvote.post_id = @post.id
        @postvote.user_id = session[:user].id
        @tags = params[:Tags]   # string of all the tags
        @tags_post = @tags.split(" ")  # array containing tags
        @tags_post.each do |tag|
          @tag_obj = Tag.new
          @tag_obj.tag_name = tag
          @tag_obj.post_id= @post.id
          @tag_obj.save
        end


        @postvote.save
        format.html { redirect_to @post, notice: "Post was successfully created " }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @tags = params[:Tags]   # string of all the tags
    @tags_post = @tags.split(" ")  # array containing tags
    @tags_post.each do |tag|
      @tag_obj = Tag.new
      @tag_obj.tag_name = tag
      @tag_obj.post_id= @post.id
      @tag_obj.save
      end
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy


      @post = Post.find(params[:id])
      @t = Tag.find_all_by_post_id(params[:id])
      @t.each do |tag|
        tag.destroy
        tag.save
      end
      @post.destroy





    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def vote
    p = Post.find(params[:my_id])
    @owner_of_post = p.user_id
    if(@owner_of_post != session[:user].id)
      if PostVote.count_by_sql("select count(*) from post_votes where user_id=#{session[:user].id} and post_id = #{params[:my_id]}") == 0
        @post_vote = PostVote.new
        @post_vote.user_id = session[:user].id
        @post_vote.post_id = params[:my_id]
        @post_vote.save
        redirect_to(:controller => 'posts',:action => 'index')
      else
        redirect_to(:controller => 'posts',:action => 'index')
      end
    else
      redirect_to(:controller => 'posts',:action => 'index')
    end

  end
  def search
    @search = params[:search]
    @filter = params[:theme]
    if (@filter == 'user')
      session[:search] = 'true'
      @posts = Post.find_all_by_user_id(((User.find_by_username(params[:search])).id))
      redirect_to :controller => 'posts' , :action => 'index' , :post => @posts
    end
  end

  def display_search

  end
end
