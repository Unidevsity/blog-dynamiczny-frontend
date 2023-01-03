class Post < ApplicationRecord
  has_one_attached :cover_image
  has_rich_text :body
end
