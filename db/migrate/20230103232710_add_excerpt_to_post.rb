class AddExcerptToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :excerpt, :text
  end
end
