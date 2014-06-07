require 'spec_helper'

describe Post do

  before :each do
    @post = Post.new(:post_title => "A title", :post_content => "It's Content")
  end

  it 'should be created' do
    @post.should_not be_nil
  end

   it 'should have title' do
     @post.post_title.should_not be_nil
  end

  it 'should have content' do
      @post.post_content.should_not be_nil
  end

#  it { should have_many(:comments) }


 # it 'should have a user' do
  #  @post.should belong_to :users
  #  @post.user_id.should_not be_nil
  #end
    end