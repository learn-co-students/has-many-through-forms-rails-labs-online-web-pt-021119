class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, reject_if: :all_blank
  #accepts_nested_attributes_for :comments
  def category_ids=(category_ids)
    category_ids.each do |category_id|
      self.categories << Category.find(category_id) unless category_id.empty?
    end
  end

  def users_who_commented
    self.comments.collect {|c| c.user}.uniq
  end
end
