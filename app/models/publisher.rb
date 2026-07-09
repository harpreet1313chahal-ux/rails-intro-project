class Publisher < ApplicationRecord
  has_many :books

  validates :name,
            presence: true,
            uniqueness: true,
            length: { minimum: 2 }
end