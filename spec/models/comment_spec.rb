require 'spec_helper'

describe Comment do
  before :each do
    @comment = Comment.new(:comment_con => "A comment", :post_id => "2")
  end

  it 'should be created' do

    @comment.should_not be_nil
  end

  it 'should have content' do

    @comment.comment_con.should_not be_nil
  end

  it 'should be related to a post' do

    @comment.post_id.should_not be_nil
  end



end