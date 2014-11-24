class Comments < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  acts_as_likeable
  include PublicActivity::Model
  tracked
end
