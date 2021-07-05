class AddPostRefToTag < ActiveRecord::Migration[5.0]
  def change
    add_reference :tags, :post, foreign_key: true
  end
end
