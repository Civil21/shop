class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true, dependent: :destroy
  has_many :comments, as: :object, dependent: :destroy

  def root
    if object_type == 'Comment'
      object.root
    else
      object
    end
  end
end
