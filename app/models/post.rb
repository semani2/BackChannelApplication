class Post < ActiveRecord::Base
   include Comparable
  belongs_to :category
  belongs_to :user
  attr_accessible :post_content, :post_title  ,:category_id ,:tags
  has_many :comments
  has_many :tags

  validates :post_title , :presence => true
  validates :post_content , :presence => true
end
