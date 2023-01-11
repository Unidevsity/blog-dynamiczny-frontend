# frozen_string_literal: true

class PostCoverComponent < ViewComponent::Base

  def initialize(cover_image)
    @cover_image = cover_image
  end

  def cover_image_display
    if cover_image.attached?
      cover_image
    else
      "https://images.unsplash.com/photo-1496128858413-b36217c2ce36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1679&q=80"
    end
  end

  private

  attr_reader :cover_image
end
