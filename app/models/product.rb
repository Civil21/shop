class Product < ApplicationRecord
  has_many_attached :images
  has_many :comments, as: :object, dependent: :destroy
end
