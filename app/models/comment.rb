class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  #validates :user, uniqueness: true

  def user_attributes=(user_hash)
    user_hash.values.each do |v|
      user = User.find_or_create_by(username: v)
      self.user = user
    end
  end

end
