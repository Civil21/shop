# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images
  has_many :comments, as: :object, dependent: :destroy
  has_many :tags
  has_many :categories, through: :tags
  has_many :orders

  def all_tags
    categories.map(&:name).join(',')
  end

  def all_tags=(names)
    names = names.split(',').map { |name| name.strip.downcase }
    names.delete('')
    categories.clear
    categories << names.to_set.map do |name|
      Category.find_or_create_by!(name: name)
    end
  end
end
