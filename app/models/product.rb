class Product < ApplicationRecord
  has_many_attached :pictures
  validates :title, :description, presence: true
end
