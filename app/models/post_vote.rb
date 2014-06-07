class PostVote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :post_id


end
