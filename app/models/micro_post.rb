class MicroPost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  default_scope order: 'micro_posts.created_at DESC'

  validates :content, presence: true, length: { maximum: 140 }	
  validates :user_id, presence: true
end
