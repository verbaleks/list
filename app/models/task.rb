class Task < ActiveRecord::Base
  attr_accessible :title, :task, :from, :to, :category_id
	belongs_to :category
	scope :by_task, lambda{ |category_id| where(:category_id => category_id)}

	validates :title, :presence => true
	validates :task, :presence => true
end