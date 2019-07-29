class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  # def category_ids=(category_ids)
  #   category_ids.each do |category_id|
  #     self.categories << Category.find(category_id) unless category_id.empty?
  #   end
  # end
  #
  # def user_comments
  #   self.comments.map {|c| c.user}.uniq
  # end


end
