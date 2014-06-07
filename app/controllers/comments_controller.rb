class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.post_id = session[:post_id]
    @comment.user_id = session[:user].id
    session.delete(:post_id)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :controller => 'comments' , :action => 'new' ,:post_id => @comment.post_id}
         format.json { render json: @comment, status: :created, location: @comment }

      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :controller => 'comments' , :action => 'new' ,:post_id => @comment.post_id
    respond_to do |format|
      format.html {  }
      format.json { head :no_content }
    end
  end

  def vote
    c = Comment.find(params[:comment_id])
    if CommentVote.count_by_sql("select count(*) from comment_votes where user_id=#{session[:user].id} and comment_id = #{c.id}") == 0
      @comment_vote = CommentVote.new
      @comment_vote.user_id = session[:user].id
      @comment_vote.comment_id = c.id
      @comment_vote.save
      redirect_to(:controller => 'comments',:action => 'new' , :post_id=> c.post_id)
    else
      redirect_to(:controller => 'comments',:action => 'new' , :post_id=> c.post_id)
    end
  end
end
