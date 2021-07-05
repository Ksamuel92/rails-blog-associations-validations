class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  accepts_nested_attributes_for :tags
  validates :name, presence: true
  validates :content, presence: true

  def tags_attributes=(tags_attributes)
    tags_attributes.each_value do |tag_attribute|
        if tag_attribute[:name].present?
            tag = Tag.find_or_create_by(tag_attribute)
            self.tags << tag
        end
    end
  end
  
end
