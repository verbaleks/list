class Category < ActiveRecord::Base
  attr_accessible :title, :description, :user_id
	has_many :tasks
	belongs_to :user
	validates :title, :presence => true, :uniqueness => true 
	validates :description, :presence => true

end
