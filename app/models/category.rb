# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :products, through: :tags
  validates :name, presence: true
end
