class Post < ActiveRecord::Base
  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id

  belongs_to :sub

  has_many :post_subs

  has_many :cross_subs,
    through: :post_subs,
    source: :sub

  has_many :comments

  has_many :votes, as: :voteable

end