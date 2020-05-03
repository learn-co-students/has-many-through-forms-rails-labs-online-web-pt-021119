class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
    if user_attributes[:username].present?
      user = User.find_or_create_by(username: user_attributes[:username])
      self.user_id = user.id
    end
  end

end
