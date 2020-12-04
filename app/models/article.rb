class Article < ApplicationRecord
  has_many :comments, dependent: :destroy # allows comments and deletes them if the article is deleted
  validates :title, presence: true,
                    length: { minimum: 5}
end
