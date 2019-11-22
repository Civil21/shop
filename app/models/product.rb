# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images
  has_many :comments, as: :object, dependent: :destroy
  has_many :tags
  has_many :categories, through: :tags

  def all_tags=(names)
    names = names.split(',').map { |name| name.strip.downcase }
    names.delete('')
    names.to_set.map do |name|
      Tag.find_or_create_by!(category_id: Category.first_or_create!(name: name).id, product_id: id)
    end
    tags.map do |tag|
      tag.destroy unless names.include?(Category.find(tag.category_id).name)
    end
  end
end
