class Post < ApplicationRecord
  validates :title, :description, presence: true
  validates :description, length: { minimum: 10 }

  has_many :comments
end
