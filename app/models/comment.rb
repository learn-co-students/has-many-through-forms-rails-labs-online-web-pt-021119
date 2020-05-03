class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user)
    self.user= User.find_or_create_by(username: user[:username])
    self.user.update(user)
  end

end
