require 'spec_helper'

describe 'A User' do

  before :each do
    @user = User.new(:username => "A username", :password => "A password", :name=> "A name", :usertype => "A type")
     end

  it 'should be created' do
    @user.should_not be_nil
  end

  it 'should have username' do

    @user.username.should_not be_nil
  end

  it 'should have password' do

    @user.password.should_not be_nil
  end

  it 'should have name' do
        @user.name.should_not be_nil
  end

  it 'should have unique username'  do
     @user1=User.new(:username => "Another username", :password => "Another password", :name=> "Another name", :usertype => "Another type")
     @user.username.should_not match(@user1.username)
  end

 # it 'should be an authentic user' do
  #    @user2=@user.authenticate(@user.username,@user.password)
   #   @user2.should_not be_nil
  #end

 it { should have_many(:posts) }
  end