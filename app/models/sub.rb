class Sub < ActiveRecord::Base
  belongs_to :moderator,
    class_name: 'User',
    foreign_key: :moderator_id

  has_many :posts,
    class_name: 'Post',
    foreign_key: :sub_id

  has_many :post_subs

  has_many :cross_posts,
    through: :post_subs,
    source: :post
end
