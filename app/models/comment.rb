class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :body, length: {minimum: 1}

  belongs_to :user
  belongs_to :mythread
end
