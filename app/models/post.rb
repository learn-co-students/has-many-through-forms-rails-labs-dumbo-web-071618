class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :user, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |attribute|
      new_category = Category.find_or_create_by(attribute)
      self.post_categories.build(category: new_category) 
    end
  end
end
