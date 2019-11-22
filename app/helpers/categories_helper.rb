# frozen_string_literal: true

module CategoriesHelper
  def tags(object)
    raw object.categories.map { |category|
      link_to category.name, category_path(category.name), class: 'badge tag'
    }.join(' ')
  end
end
