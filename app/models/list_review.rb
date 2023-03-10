class ListReview < ApplicationRecord
  belongs_to :list
  validates :comment, presence: true
  validates :rating, presence: true

end
