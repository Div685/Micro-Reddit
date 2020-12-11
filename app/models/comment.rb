class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, length: { minimum: 3, maximum: 256 }
end
