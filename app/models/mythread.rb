class Mythread < ActiveRecord::Base
  validates :title, presence: true
  validates :title, length: {minimum: 1}
  validates :body, presence: true
  validates :body, length: {minimum: 1}

  belongs_to :user
end
