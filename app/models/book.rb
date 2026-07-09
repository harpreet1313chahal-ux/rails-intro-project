class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  belongs_to :category

  validates :title, presence: true
  validates :rating, numericality: true, allow_nil: true
end