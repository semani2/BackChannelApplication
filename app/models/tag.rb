class Tag < ActiveRecord::Base
  belongs_to :post
  attr_accessible :tag_name , :post_id
end
