class Category < ApplicationRecord
  has_many :books

  validates :name,
            presence: true,
            uniqueness: true,
            length: { minimum: 3 }
end