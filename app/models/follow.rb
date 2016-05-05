class Follow < ActiveRecord::Base
  validates :user_id, presence: true
  validates :followed_id, presence: true
  validates :followed_id, numericality: { only_integer: true }
end
