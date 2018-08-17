class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  validates :post_id, presence: true

  accepts_nested_attributes_for :user

  def user_attributes=(user_attributes)
    if user_attributes["username"].present?
      self.user = User.find_or_create_by(user_attributes)
    end
  end

end
