class User < ActiveRecord::Base
  attr_accessible :name, :password, :username, :usertype
  has_many :posts

  validates :username , :presence =>true
  validates :password , :presence =>true
  validates :name , :presence =>true
  def User.authenticate (username1,password)
      user1 = User.find_by_username(username1)

  if user1
    pwd =  user1.password
    if pwd==password
      #checking the type of user

      return user1
    end
  end
  end
end
