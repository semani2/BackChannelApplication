class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :comment_con  , :post_id

end
